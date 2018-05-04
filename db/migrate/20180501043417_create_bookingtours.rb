class CreateBookingtours < ActiveRecord::Migration[5.1]
  def change
    create_table :bookingtours do |t|
      t.integer :user_id
      t.integer :tour_id
      t.integer :price
      t.integer :amount_persion
      t.integer :status
      t.integer :datetour_id

      t.timestamps
    end
  end
end
