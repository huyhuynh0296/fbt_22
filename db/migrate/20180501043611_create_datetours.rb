class CreateDatetours < ActiveRecord::Migration[5.1]
  def change
    create_table :datetours do |t|
      t.string :starttime
      t.string :stoptime
      t.references :tour

      t.timestamps
    end
  end
end
