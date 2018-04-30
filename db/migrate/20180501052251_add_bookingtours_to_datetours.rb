class AddBookingtoursToDatetours < ActiveRecord::Migration[5.1]
  def change
    add_reference :datetours, :bookingtours, foreign_key: true
  end
end
