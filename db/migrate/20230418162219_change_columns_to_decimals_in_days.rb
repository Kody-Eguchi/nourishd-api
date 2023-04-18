class ChangeColumnsToDecimalsInDays < ActiveRecord::Migration[6.1]
  def change
    change_column :days, :potassium, :decimal, precision: 10, scale: 5
    change_column :days, :vitamin_a, :decimal, precision: 10, scale: 5
    change_column :days, :vitamin_c, :decimal, precision: 10, scale: 6
    change_column :days, :calcium, :decimal, precision: 10, scale: 1
    change_column :days, :iron, :decimal, precision: 10, scale: 3
    change_column :days, :cholesterol, :decimal, precision: 10, scale: 1
  end
end
