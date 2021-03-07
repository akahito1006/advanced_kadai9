class ThanksMailer < ApplicationMailer
    default :from => "nekodora5k@gmail.com"

    def send_signup_email
        @greeting = "Hi"
        mail( :to => @user.email, :subject => "会員登録が完了しました。" )
    end
end
