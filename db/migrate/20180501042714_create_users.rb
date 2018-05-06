class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :role, default: 0
      t.string :avatar
      t.string :remember_digest

      t.timestamps
    end
  end
end
