class UserMailer < ApplicationMailer

    def welcome_email(user)
        @user = user
        @url =  'https://golshan-stay.herokuapp.com'
        mail(to: user.email, subject:'Welcome To Golshan Stay')

    end

end
