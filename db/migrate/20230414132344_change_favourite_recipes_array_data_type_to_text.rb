class ChangeFavouriteRecipesArrayDataTypeToText < ActiveRecord::Migration[6.1]
  def change
    change_column :favourites, :recipes, :text, array: true, using: 'STRING_TO_ARRAY(ARRAY_TO_STRING(recipes, \',\'), \',\')', default: []
  end
end
