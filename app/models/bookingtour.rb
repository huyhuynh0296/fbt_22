class Bookingtour < ApplicationRecord
  belongs_to :user
  belongs_to :userpay, optional: true
  belongs_to :datetour, optional: true
  belongs_to :tour

  scope :search_by_user, ->(user_id){where "user_id = ?", user_id}
  scope :search_booked_finished, ->(st){where "status = ?", st}
  scope :search_by_tour_id, ->(tour_id){where "tour_id = ?", tour_id}
  scope :search_by_datetour, ->(datetour_id){where "datetour_id = ?", datetour_id}
end
