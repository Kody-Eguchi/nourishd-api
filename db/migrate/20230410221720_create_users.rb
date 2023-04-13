class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :weight
      t.string :height
      t.string :age
      t.timestamps
    end
  end
end
