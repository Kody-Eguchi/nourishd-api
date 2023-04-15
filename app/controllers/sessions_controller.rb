class SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by_email(params[:email])
    if user == user.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      render json: {success: true, message: 'Login Success'}
    else
      render json: {success: false, message: 'Invalid email or password'}
    end

  end

  def destroy
    session[:user_id] = nil
  end

end
