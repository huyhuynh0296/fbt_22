class Rating < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :tours, dependent: :destroy
end
