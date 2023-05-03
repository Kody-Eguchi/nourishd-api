class SessionsController < ApplicationController
  include ActionController::Cookies


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
    # session[:user_id] = nil
    # reset_session
    cookies.delete(:_nutrition_app_api_session)
    render json: {success: true, message: 'Logout Success'}
  end


  def userLoggedIn?
    user_cookie = cookies[:_nutrition_app_api_session]
    @user = User.find_by_id(user_cookie)
    render json: {user: @user , success: true}
  end


end
