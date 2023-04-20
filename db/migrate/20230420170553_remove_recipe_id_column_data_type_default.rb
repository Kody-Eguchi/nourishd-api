class RemoveRecipeIdColumnDataTypeDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :favourites, :recipe_id, nil
  end
end
