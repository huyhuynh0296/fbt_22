class Image < ApplicationRecord
  has_many :tour, dependent: :destroy
end
