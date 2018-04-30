class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :address
      t.string :numberphone
      t.integer :role
      t.string :images

      t.timestamps
    end
  end
end
