class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :point
      t.integer :user_id
      t.integer :tour_id

      t.timestamps
    end
  end
end
