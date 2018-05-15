class Datetour < ApplicationRecord
  belongs_to :bookingtour, optional: true

  has_many :tours, dependent: :destroy

  scope :find_by_id, -> (id_date){where "id = ?", id_date}
  scope :find_date, ->{where "starttime >= #{Date.today.strftime("%Y/%m/%d")}" }
  scope :find_by_idtour, -> (id_date){where "tour_id = ?", id_date}
end
