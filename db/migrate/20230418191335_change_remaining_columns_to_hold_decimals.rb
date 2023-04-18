class ChangeRemainingColumnsToHoldDecimals < ActiveRecord::Migration[6.1]
  def change
    change_column :days, :calories, :decimal, precision: 10, scale: 5
    change_column :days, :fat, :decimal, precision: 10, scale: 5
    change_column :days, :carbohydrates, :decimal, precision: 10, scale: 6
    change_column :days, :sodium, :decimal, precision: 10, scale: 6
    change_column :days, :sugar, :decimal, precision: 10, scale: 6
    change_column :days, :protein, :decimal, precision: 10, scale: 6
    change_column :days, :fiber, :decimal, precision: 10, scale: 6
    change_column :days, :calcium, :decimal, precision: 10, scale: 5
    change_column :days, :iron, :decimal, precision: 10, scale: 5
    change_column :days, :cholesterol, :decimal, precision: 10, scale: 5
  end
end
