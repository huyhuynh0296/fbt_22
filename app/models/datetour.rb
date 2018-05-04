class Datetour < ApplicationRecord
  has_many :bookingtour, dependent: :destroy
end
