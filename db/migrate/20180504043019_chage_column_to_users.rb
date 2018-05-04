class ChageColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :role, :integer, defauls: 0
  end
end
