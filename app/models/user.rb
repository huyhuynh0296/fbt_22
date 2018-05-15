class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bookingtours, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :datetours, dependent: :destroy

  enum role: {
    admin: 1,
    manage: 2,
    user: 0}
end
