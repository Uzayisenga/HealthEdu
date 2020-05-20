class MessageMailer < ApplicationMailer
    def email
        @user = params[:user]
        mail(
          to: @user.email,
          subject: "hello from app",
          from: ENV['FROM_EMAIL'],
          custom_args: {
            id: @user.id
          }
        )
      end
end
