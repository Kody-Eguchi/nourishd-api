class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  include CookiesHelper

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: {user: @user}
  end

  # POST /users
  def create
    puts params
    @user = User.new(user_params)

    if @user.save
      signin(@user)
      render json: { user: @user, success: true }, status: :created
    else
      render json: { errors: @user.errors.full_messages, success: false }, status: :unprocessable_entity
    end
    
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end


  def getUserById
    user_id = decrypt_cookie_value(:_nutrition_app_api_session)
    @user = User.find(user_id)
    render json: {user: @user}
  end

  private
    def signin(user)
      session[:user_id] = user.id
    end



    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      # params.fetch(:user, {})
      params.require(:user).permit(
        :username,
        :email,
        :password,
        :weight,
        :height,
        :age,
        :sex
      )
    end
end
