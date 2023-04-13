require 'edamom-api'
require 'json'

class RecipesController < ApplicationController
  def index
    response = EdamomApi.get
    render json: response
  end

  def show
    response = EdamomApi.get(params[:id])
    render json: response
  end
end
