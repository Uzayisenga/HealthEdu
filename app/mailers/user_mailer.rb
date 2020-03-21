class UserMailer < ApplicationMailer
    default from: 'aminauzayisenga@gmail.com'
    prepend_view_path "custom/path/to/mailer/view"
 
  def welcome_email
    @user = params[:user]
    @url  = 'http://localhost:3000/users/sign_up'
    mail(to: @user.email, subject: 'Welcome to Healthedu Site',
    template_path: 'notifications',
    template_name: 'another') do |format|
    format.html { render 'another_template' }
    format.text { render plain: 'Render text' }
  end
  end
end