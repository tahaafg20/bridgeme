require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    rooms: Field::HasMany,
    ngos: Field::HasMany,
    educations: Field::HasMany,
    healths: Field::HasMany,
    communities: Field::HasMany,
    posts: Field::HasMany,
    reservations: Field::HasMany,
    guest_reviews: Field::HasMany,
    host_reviews: Field::HasMany,
    notifications: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    provider: Field::String,
    uid: Field::String,
    fullname: Field::String,
    confirmation_token: Field::String,
    confirmed_at: Field::DateTime,
    confirmation_sent_at: Field::DateTime,
    unconfirmed_email: Field::String,
    phone_number: Field::String,
    description: Field::Text,
    unread: Field::Number,
    merchant_id: Field::String,
    merchant_provider: Field::String,
    merchant_access_code: Field::String,
    merchant_publishable_key: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :rooms,
    :ngos,
    :educations,
    :healths,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :rooms,
    :ngos,
    :educations,
    :healths,
    :communities,
    :posts,
    :reservations,
    :guest_reviews,
    :host_reviews,
    :notifications,
    :id,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :created_at,
    :updated_at,
    :provider,
    :uid,
    :fullname,
    :confirmation_token,
    :confirmed_at,
    :confirmation_sent_at,
    :unconfirmed_email,
    :phone_number,
    :description,
    :unread,
    :merchant_id,
    :merchant_provider,
    :merchant_access_code,
    :merchant_publishable_key,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :rooms,
    :ngos,
    :educations,
    :healths,
    :communities,
    :posts,
    :reservations,
    :guest_reviews,
    :host_reviews,
    :notifications,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :provider,
    :uid,
    :fullname,
    :confirmation_token,
    :confirmed_at,
    :confirmation_sent_at,
    :unconfirmed_email,
    :phone_number,
    :description,
    :unread,
    :merchant_id,
    :merchant_provider,
    :merchant_access_code,
    :merchant_publishable_key,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
