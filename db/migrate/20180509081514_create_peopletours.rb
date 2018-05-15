class CreatePeopletours < ActiveRecord::Migration[5.1]
  def change
    create_table :peopletours do |t|
      t.string :title
      t.integer :value

      t.timestamps
    end
  end
end
