class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :image
      t.string :clock
      t.text :description
      t.integer :price
      t.integer :slot
      t.references :place
      t.references :image
      t.references :category
      t.references :user

      t.timestamps
    end
  end
end
