class RemoveTourIdFromUserpays < ActiveRecord::Migration[5.1]
  def change
    remove_column :userpays, :tour_id, :integer
  end
end
