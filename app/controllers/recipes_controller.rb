require 'edamom-api'
require 'json'

class RecipesController < ApplicationController
  def index
    response = EdamomApi.get
    render json: response
  end

  def show
    response = EdamomApi.get(params[:id])

  
    parsed_response = JSON.parse(response)
    if params['recipe_id']
     
      hits = parsed_response['hits']
    
      hits.each do |hit|
        recipe = hit['recipe']
        puts '🍋'
        puts recipe
        puts '🍋'
        if recipe['uri'].include?(params['recipe_id'])
          return render json: recipe
        end
      end
    end
    render json: {response: recipes, success: true} 
  end




end
