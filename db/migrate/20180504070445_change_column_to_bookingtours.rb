class ChangeColumnToBookingtours < ActiveRecord::Migration[5.1]
  def change
    change_column :bookingtours, :status, :integer, default: 0
  end
end
