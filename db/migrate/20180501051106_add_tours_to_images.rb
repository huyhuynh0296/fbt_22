class AddToursToImages < ActiveRecord::Migration[5.1]
  def change
    add_reference :images, :tours, foreign_key: true
  end
end
