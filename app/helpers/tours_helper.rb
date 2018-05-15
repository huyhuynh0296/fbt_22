module ToursHelper
  def status st
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
end
