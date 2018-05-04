class AddPlacesToTours < ActiveRecord::Migration[5.1]
  def change
    add_reference :tours, :places, foreign_key: true
  end
end
