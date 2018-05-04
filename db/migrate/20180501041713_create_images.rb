class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.integer :tour_id
      t.string :url
      t.string :title

      t.timestamps
    end
  end
end
