module BookingtoursHelper
  def price_booking price1, amount
    if price1.nil? || amount.nil?
      return "error!"
     else return "#{price1*amount} $"
     end
  end
end
