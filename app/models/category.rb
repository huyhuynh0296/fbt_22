class Category < ApplicationRecord
  has_many :tours, dependent: :destroy

  before_save :downcase_name
  validates :name, presence: true,
    length: {maximum: Settings.category.maximum_name},
    uniqueness: true

  scope :category_newest, ->{order updated_at: :desc}
  scope :categories_include, ->(parent){where "parent = ?", parent}

  def downcase_name
    self.name = name.downcase
  end
end
