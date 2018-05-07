class Comment < ApplicationRecord
  belongs_to :user
  has_many :tours, dependent: :destroy
end
