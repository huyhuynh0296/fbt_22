class AddUsersToUserpays < ActiveRecord::Migration[5.1]
  def change
    add_reference :userpays, :users, foreign_key: true
  end
end
