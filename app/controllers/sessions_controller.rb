class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create 
  def create
    auth = request.env["omniauth.auth"]
    @user = User.sign_in_from_omniauth(auth)
    self.current_user = @user
    session[:user_id] = @user.name
    redirect_to roots_path, notice: "Welcome Back"
  end
    
    def destroy
      session[:user_id] = nil
      redirect_to root_url, :notice => "Signed out!"
    end

  end
