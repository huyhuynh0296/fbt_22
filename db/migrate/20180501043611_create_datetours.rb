class CreateDatetours < ActiveRecord::Migration[5.1]
  def change
    create_table :datetours do |t|
      t.integer :tour_id
      t.string :starttime
      t.string :stoptime

      t.timestamps
    end
  end
end
