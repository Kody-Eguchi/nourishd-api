class DaysController < ApplicationController
  before_action :set_day, only: [:show, :update, :destroy]
  include CookiesHelper

  # GET /days
  def index
    @days = Day.all

    render json: @days
  end

  # GET /days/1
  def show
    render json: @day
  end

  # POST /days
  def create
    
    user_id = decrypt_cookie_value(:_nutrition_app_api_session)
    # to params add user_id, also is it too late to insert a new data here?
    params[:user_id] = user_id
    @day = Day.new(day_params)

    if @day.save
      render json: @day, status: :created, location: @day
    else
      render json: @day.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /days/1
  def update
    if @day.update(day_params)
      render json: @day
    else
      render json: @day.errors, status: :unprocessable_entity
    end
  end

  # DELETE /days/1
  def destroy
    @day.destroy
  end


  # Update Day Row Contents
  def updateDayInfo
    user_id = decrypt_cookie_value(:_nutrition_app_api_session)
    @day = Day.where(user_id: user_id)
          .where("DATE(created_at) = ?", Date.today)
          .first

    if @day == nil
      @day = Day.create!(user_id: user_id)
    end

    day_params.each do |key, value|
      
      if key == 'history'
        @day.history << value
      else
        @day[key] += value.to_f
      end

    end
    
    if @day.save
      render json: { day: @day, success: true }
    else
      render json: @day.errors, status: :unprocessable_entity
    end

  end

# Remove items from history array and subtract nutrient from each column
def removeItem
  user_id = decrypt_cookie_value(:_nutrition_app_api_session)
  @day = Day.where(user_id: user_id)
        .where("DATE(created_at) = ?", Date.today)
        .first

  day_params.each do |key, value|
    if key == 'history'
      index = @day.history.index(value)
      @day.history.delete_at(index) if index
    else
      @day[key] += value.to_f
      if @day[key] < 0
        @day[key] = 0
      end
    end
  end

  if @day.save
    render json: { day: @day, success: true }
  else
    render json: @day.errors, status: :unprocessable_entity
  end
  
end




# Get Day Row By User Id
  def getDayById
    user_id = decrypt_cookie_value(:_nutrition_app_api_session)
    @day = Day.where(user_id: user_id)
          .where("DATE(created_at) = ?", Date.today)
          .first
    puts @day
    render json: { day: @day, success: true }
  end

  def addCustomMeal
    user_id = decrypt_cookie_value(:_nutrition_app_api_session)
    @day = Day.where(user_id: user_id)
          .where("DATE(created_at) = ?", Date.today)
          .first
  
    if @day == nil
      @day = Day.create!(user_id: user_id)
    end
  
    day_custom_meal_params.each do |key, value|
      if key == 'history'
        @day.history << value
      else
        @day[key] += value.to_f
      end
    end

    if @day.save
      render json: { day: @day, success: true }
    else
      render json: @day.errors, status: :unprocessable_entity
    end
  
  end 
  



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def day_params
      params.require(:day).permit(
        :user_id,
        :calories,
        :fat,
        :carbohydrates,
        :sodium,
        :sugar,
        :protein,
        :fiber,
        :potassium,
        :vitamin_a,
        :vitamin_c,
        :calcium,
        :iron,
        :cholesterol,
        history:  {}
      )
      
    end

    def day_custom_meal_params
      params.require(:day).permit(
        :user_id,
        :calories,
        :fat,
        :carbohydrates,
        :sugar,
        :protein,
        :fiber,
        history:  {}
      )
      
    end
end
