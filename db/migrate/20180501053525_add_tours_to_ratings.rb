class AddToursToRatings < ActiveRecord::Migration[5.1]
  def change
    add_reference :ratings, :tours, foreign_key: true
  end
end
