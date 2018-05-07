class Userpay < ApplicationRecord
  belongs_to :user

  has_many :bookingtours, dependent: :destroy
end
