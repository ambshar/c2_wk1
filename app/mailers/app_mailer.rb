class AppMailer < ActionMailer::Base

  def mail_on_post_creation(user, post)
    @user = user
    @post = post
    mail from: 'ambshar@gmail.com', to: user.email, subject: "You created a new post"
  end

  
end