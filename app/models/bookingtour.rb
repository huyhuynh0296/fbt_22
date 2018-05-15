class Bookingtour < ApplicationRecord
  belongs_to :user
  belongs_to :userpay
  belongs_to :tour
  belongs_to :datetour

  has_many :datetours, dependent: :destroy
end
