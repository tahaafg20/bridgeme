class UserMailer < ApplicationMailer

    def welcome_email(user)
        @user = user
        @url =  'www.golshanstay.site'
        mail(to: user.email, subject:'Welcome To Golshan Stay')
    end

end
