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
    # session[:user_id] = nil
    # reset_session
    cookies.delete(:_nutrition_app_api_session)
  end


    # def current_user
    #   render json: { logged_in: !!current_user, user: current_user }
    # end


end
