class FixSpellingMistakeOnDaysColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :days, :carbohydrate, :carbohydrates
  end
end
