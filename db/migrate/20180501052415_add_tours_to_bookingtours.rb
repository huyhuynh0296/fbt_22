class AddToursToBookingtours < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookingtours, :tours, foreign_key: true
  end
end
