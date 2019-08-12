class User < ApplicationRecord
            
      
            
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]
         after_commit :send_pending_devise_notifications
         validates :fullname, presence: true, length: {maximum: 50}

         has_many :rooms
         has_many :reservations
       
         has_many :guest_reviews, class_name: "GuestReview", foreign_key: "guest_id"
         has_many :host_reviews, class_name: "HostReview", foreign_key: "host_id"
         has_many :notifications
       
         has_one :setting
         after_create :add_setting
         
         def add_setting
          Setting.create(user: self, enable_sms: true, enable_email: true)
        end

        def send_devise_notification(notification, *args)
          devise_mailer.send(notification, self, *args).deliver_later
        end
         def self.from_omniauth(auth)
          user = User.where(email: auth.info.email).first
          if user
            return user
          else
            where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
              user.email = auth.info.email
              user.password = Devise.friendly_token[0,20]
              user.fullname = auth.info.name
              # user.image = auth.info.image
              user.uid = auth.uid
              user.provider = auth.provider
              # If you are using confirmable and the provider(s) you use validate emails,
              # uncomment the line below to skip the confirmation emails.
              # user.skip_confirmation!
            end
          end
        end
        def self.new_with_session(params, session)
          super.tap do |user|
            if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
              user.email = data["email"] if user.email.blank?
            end
          end
        end
        protected
      
            def send_devise_notification(notification, *args)
              # If the record is new or changed then delay the
              # delivery until the after_commit callback otherwise
              # send now because after_commit will not be called.
              if new_record? || changed?
                pending_devise_notifications << [notification, args]
              else
                render_and_send_devise_message(notification, *args)
              end
            end
      
            private
      
            def send_pending_devise_notifications
              pending_devise_notifications.each do |notification, args|
                render_and_send_devise_message(notification, *args)
              end
      
              # Empty the pending notifications array because the
              # after_commit hook can be called multiple times which
              # could cause multiple emails to be sent.
              pending_devise_notifications.clear
            end
      
            def pending_devise_notifications
              @pending_devise_notifications ||= []
            end
      
            def render_and_send_devise_message(notification, *args)
              message = devise_mailer.send(notification, self, *args)
      
              # Deliver later with Active Job's `deliver_later`
              if message.respond_to?(:deliver_later)
                message.deliver_later
              # Remove once we move to Rails 4.2+ only, as `deliver` is deprecated.
              elsif message.respond_to?(:deliver_now)
                message.deliver_now
              else
                message.deliver
              end
            end

end
