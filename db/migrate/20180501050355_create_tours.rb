class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :image
      t.text :description
      t.integer :price
      t.references :place
      t.references :image
      t.references :category

      t.timestamps
    end
  end
end
