class UserMailer < ApplicationMailer
    default from: "no-reply@lucramassamy.fr"

    def welcome_email(user)
        @user = user

        @url = "www.lucramassamy.fr"

        mail(to: @user.email, subject: "Bienvenue !")
    end
  
end
