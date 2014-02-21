class SessionsController < ApplicationController
  def new

  end

  def create
    
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      if user.two_factor_auth?
        session[:two_factor] = true
        user.generate_pin!  #generate a pin
        # send pin to twilio and sms that to user
        user.send_pin_to_twilio
        redirect_to pin_path  # show pin form
      else
      
      login_user!(user)
      
      end
    else
      flash[:notice] = "There is something wrong with your username or password"
      redirect_to login_path

    end

  end

  def pin
    access_denied if session[:two_factor].nil?
    if request.post?
      user = User.find_by pin: params[:pin]
      if user
        session[:two_factor] = nil
        user.remove_pin!
        login_user!(user)    
      else
      flash[:error] = "Sorry that is not the correct pin"
      redirect_to pin_path
      end
    end
  end

  def update

  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've logged out"
    redirect_to root_path
  end

  private

  def login_user!(user)
    session[:user_id] = user.id
    flash[:notice] = "You are logged in"
      
    redirect_to root_path
  end

end