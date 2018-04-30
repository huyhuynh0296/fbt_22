class Rating < ApplicationRecord
  has_many :user, dependent: :destroy
  has_many :tour, dependent: :destroy
end
