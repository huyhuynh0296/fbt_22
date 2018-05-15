class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :image
      t.text :description
      t.decimal :price, precision: 12, scale: 3
      t.string :clock
      t.integer :slot
      t.boolean :active, default: true
      t.references :place
      t.references :image
      t.references :category
      t.references :user

      t.timestamps
    end
  end
end
