class Tour < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user
  belongs_to :place, optional: true
  belongs_to :datetour, optional: true

  has_many :bookingtours, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :order_items, dependent: :destroy

  mount_uploader :image, ImageUploader

  scope :tour_newest, ->{order created_at: :desc}
  scope :search_tour, ->(tour_id){where "id = ?", tour_id}
  scope :limit_tour, -> (limit) { order("created_at desc").limit(limit)}
  scope :search_tours_by_category, ->(category_id){where "category_id = ?", category_id}
  default_scope { where(active: true) }

end
