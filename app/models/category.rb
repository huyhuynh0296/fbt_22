class Category < ApplicationRecord
  belong_to :user
  before_save :downcase_name
  validates :name, presence: true,
  length: {maximum: Settings.category.maximum_name},
  uniqueness: true

  def downcase_name
    self.style = style.downcase
  end
end
