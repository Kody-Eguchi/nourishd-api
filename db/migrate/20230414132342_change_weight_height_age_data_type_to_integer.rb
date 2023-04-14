class ChangeWeightHeightAgeDataTypeToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :weight, :integer, using: 'weight::integer'
    change_column :users, :height, :integer, using: 'height::integer'
    change_column :users, :age, :integer, using: 'age::integer'
  end
end
