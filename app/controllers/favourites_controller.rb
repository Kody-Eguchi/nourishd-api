class FavouritesController < ApplicationController
  before_action :set_favourite, only: [:show, :update, :destroy]
  include CookiesHelper

  # GET /favourites
  def index
    @favourites = Favourite.all

    render json: @favourites
  end

  # GET /favourites/1
  def show
    render json: @favourite
  end

  # POST /favourites
  def create

    user_id = decrypt_cookie_value(:_nutrition_app_api_session)
    params[:user_id] = user_id
    @favourite = Favourite.new(favourite_params.merge(user_id: user_id))

    if @favourite.save
      render json: @favourite, status: :created, location: @favourite
    else
      render json: @favourite.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /favourites/1
  def update
    if @favourite.update(favourite_params)
      render json: @favourite
    else
      render json: @favourite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favourites/1
  def destroy
    @favourite.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favourite_params
      params.require(:favourite).permit(
        :user_id,
        :recipe_id,
        :name,
        :image,
        :url,
        :diet_labels => [],
        :health_labels => [],
        :ingredient_lines => []
      )
    end
end
