class ChangeColumnOfFavourites < ActiveRecord::Migration[6.1]
  def change
    remove_column :favourites, :recipes

    add_column :favourites, :recipe_id, :jsonb, default: []
    add_column :favourites, :name, :string
    add_column :favourites, :image, :text
    add_column :favourites, :url, :text
    add_column :favourites, :diet_labels, :string, array: true, default: []
    add_column :favourites, :health_labels, :string, array: true, default: []
    add_column :favourites, :ingredient_lines, :string, array: true, default: []

  end
end
