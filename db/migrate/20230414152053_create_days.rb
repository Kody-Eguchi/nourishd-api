class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :calories, default: 0
      t.integer :fat, default: 0
      t.integer :carbohydrate, default: 0
      t.integer :sodium, default: 0
      t.integer :sugar, default: 0
      t.integer :protein, default: 0
      t.integer :fiber, default: 0
      t.integer :potassium, default: 0
      t.integer :vitamin_a, default: 0
      t.integer :vitamin_c, default: 0
      t.integer :calcium, default: 0
      t.integer :iron, default: 0
      t.integer :cholesterol, default: 0
      t.timestamps
    end
  end
end
