class Comment < ApplicationRecord
  has_many :tour, dependent: :destroy
  has_many :user, dependent: :destroy
end
