class OrderItem < ApplicationRecord
  belongs_to :tour
  belongs_to :order

  validates :quantity
  validate :tour_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      [:unit_price]
    else
      tour.price
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def tour_present
    if tour.nil?
      errors.add(:product, "tour is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    [:unit_price] = unit_price
    [:total_price] = quantity * self[:unit_price]
  end
end
end
