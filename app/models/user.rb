class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :categories, dependent: :destroy
  has_many :tours, dependent: :destroy
  has_many :bookingtours, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy

  scope :user_by_ids,->(user_ids){where "id= ?", user_ids}
  scope :can_for_manage,->{where "role <> 1"}
end
