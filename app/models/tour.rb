class Tour < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :place, optional: true

  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :datetours, dependent: :destroy

  scope :tour_newest, ->{order created_at: :desc}
end
