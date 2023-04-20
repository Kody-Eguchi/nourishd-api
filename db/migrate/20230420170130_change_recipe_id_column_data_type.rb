class ChangeRecipeIdColumnDataType < ActiveRecord::Migration[6.1]
  def change
    change_column :favourites, :recipe_id, :text
  end
end
