class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :image
      t.text :description
      t.integer :price
      t.integer :category_id
      t.integer :place_id
      t.integer :image_id

      t.timestamps
    end
  end
end
