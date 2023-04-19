class AddHistoryColumnToDays < ActiveRecord::Migration[6.1]
  def change
    add_column :days, :history, :jsonb, default: []
  end
end
