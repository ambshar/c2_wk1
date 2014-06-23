class AppMailer < ActionMailer::Base

  def mail_on_post_creation(user)
    @user = user
    mail from: 'info@postit.com', to: user.email, subject: "You created a new post"
  end

  def welcome_email(user)
    @user = user
    mail from: 'info@myflix.com', to: user.email, subject: "Welcome to MyFlix"

  end
end