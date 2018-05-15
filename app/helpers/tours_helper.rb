module ToursHelper
  def status_book st
    if st == 0
      return "Waiting"
    elsif st == 1
      return "Paid"
    elsif st == 2
      return "Processing"
    elsif st == 3
      return "Finshed"
    end
  end

  def tour_home
    @tours = Tour.limit_tour 8
  end
end
