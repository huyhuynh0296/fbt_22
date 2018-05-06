class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
<<<<<<< HEAD
      t.string :username
      t.string :email
      t.string :password
      t.string :address
      t.string :numberphone
      t.integer :role, default: 0
      t.string :images
=======
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :role, default: 0
      t.string :avatar
      t.string :remember_digest
>>>>>>> a5f22cef685deecd9c47e5b7d8c1680622cbcd3d

      t.timestamps
    end
  end
end
