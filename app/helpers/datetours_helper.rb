module DatetoursHelper
  def find_by_iddate id_date
    return unless id_date.blank?
    @date = Datetour.find_by id: id_date
  end
end
