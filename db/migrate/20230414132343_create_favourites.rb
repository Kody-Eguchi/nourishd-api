class CreateFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :recipes, array: true, default: []

      t.timestamps
    end
  end
end
