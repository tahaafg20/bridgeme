class UserMailer < ApplicationMailer

    def welcome_email(user)
        @user = user
        @url =  'https://bridgeme.site/'
        mail(to: @user.email, subject:'Welcome To BridgeMe')
    end

end
