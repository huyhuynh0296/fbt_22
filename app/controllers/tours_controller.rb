class ToursController < ApplicationController
  def index
    @tours = Tour.tour_newest.paginate page: params[:page]
    @categories = Category.all
    @places = Place.all
  end

  def show
    @tour = Tour.find_by id: params[:id]
    @category_title = category_by_id @tour
    @place_from = place_from @tour
    return if @tour
    flash[:danger] = t "tours.show.fail"
    redirect_to root_url
  end

  private

  def category_by_id tour
    @category = tour.category
    return if @category
    redirect_to :tours
  end

  def place_from tour
    @place = tour.place
    return if @place
    redirect_to :tours
  end
end
