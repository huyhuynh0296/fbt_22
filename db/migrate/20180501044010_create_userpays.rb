class CreateUserpays < ActiveRecord::Migration[5.1]
  def change
    create_table :userpays do |t|
      t.integer :user_id
      t.string :bankname
      t.string :acountnumber

      t.timestamps
    end
  end
end
