class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.datetime :deleted_at
      t.references :user
      t.integer :parent, default: 0
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
