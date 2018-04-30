class Userpay < ApplicationRecord
  has_may :user, dependent: :destroy
  has_may :bookingtour, dependent: :destroy
end
