class Tour < ApplicationRecord
  belong_to :rating
  belong_to :comment

  has_many :category, dependent: :destroy
  has_many :image, dependent: :destroy
end
