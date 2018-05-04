class AddCategoriesToTours < ActiveRecord::Migration[5.1]
  def change
    add_reference :tours, :categories, foreign_key: true
  end
end
