module BookingtoursHelper
  def price_booking price1, amount
    if price1.nil? || amount.nil?
      return "error!"
     else return "#{price1*amount} $"
     end
  end

  def save_booktour tour_id, date
    date_id ||= search_by_user(current_user.id).search_by_tour_id(tour_id).datetour_id
    return if date_id == date
    booktour = Bookingtour.new user_id: current_user.id, tour_id: tour_id, datetour_id: date
    booktour.save
  end
  def find_booktour_by_idtour tour_id
    return if tour_id.blank?
    @bookingtours = Bookingtour.search_by_tour_id(tour_id).search_booked_finished 0
  end
end
