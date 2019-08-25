Rails.application.routes.draw do
  resources :posts
  resources :ngos
  resources :healths
  resources :communities
  resources :educations
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :organizations
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',  registrations: 'users/registrations'}
  devise_scope :users do
    get "sign_out", :to => "devise/sessions#destroy"
  end
  # devise_for :users, controllers: { registrations: 'registrations' }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root 'pages#home'
    resources :users, only: [:show] do
      member do
        post '/verify_phone_number' => 'users#verify_phone_number'
        patch '/update_phone_number' => 'users#update_phone_number'
      end
    end
  
    resources :rooms, except: [:edit] do
      member do
        get 'listing'
        get 'pricing'
        get 'description'
        get 'photo_upload'
        get 'amenities'
        get 'location'
        get 'preload'
        get 'preview'
      end
      resources :photos, only: [:create, :destroy]
      resources :reservations, only: [:create]
      resources :calendars
    end
  
    resources :guest_reviews, only: [:create, :destroy]
    resources :host_reviews, only: [:create, :destroy]
  
    get '/your_trips' => 'reservations#your_trips'
    get '/your_reservations' => 'reservations#your_reservations'
    get '/your_organizations' => 'reservations#your_organizations'
    get '/healths1' => 'healths#index1'
    get '/educations1' => 'educations#index1'
    get '/communities1' => 'communities#index1'
    get '/ngos1' => 'ngos#index1'
    get 'search' => 'pages#search'
    get 'dashboard' => 'dashboards#index'

  
    resources :reservations, only: [:approve, :decline] do
      member do
        post '/approve' => "reservations#approve"
        post '/decline' => "reservations#decline"
      end
    end
  
    resources :revenues, only: [:index]
  
    resources :conversations, only: [:index, :create]  do
      resources :messages, only: [:index, :create]
    end
  
    get '/payment_method' => "users#payment"
    get '/payout_method' => "users#payout"
    post '/add_card' => "users#add_card"
  
  
    get '/notifications' => 'notifications#index'
  
    mount ActionCable.server => '/cable'
  
  end
  