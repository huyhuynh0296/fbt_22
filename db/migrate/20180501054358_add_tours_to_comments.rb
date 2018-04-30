class AddToursToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :tours, foreign_key: true
  end
end
