class Bookingtour < ApplicationRecord
  belong_to :datetour
  belong_to :userpay

  has_many :user, dependent: :destroy
  has_many :tour, dependent: :destroy
end
