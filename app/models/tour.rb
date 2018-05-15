class Tour < ApplicationRecord
  belongs_to :category
  belongs_to :datetour

  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
end
