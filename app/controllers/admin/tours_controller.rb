class Admin::ToursController < ApplicationController

  def index
    @tours = Tour.tour_newest.paginate page: params[:page]
  end
  def new
    @tour = Tour.new
    @places = Place.all
    @categories = Category.all
    @subcategories = []
    if params[:category].present?
      @subcategories = Category.categories_include params[:category]
    end
    if request.xhr?
      respond_to do |format|
      format.json {
        render json: {subcategories: @subcategories}
      }
      end
    end
  end

  def edit
    redirect_to admin_tours_url
  end
  def create
    @tour = Tour.new params_tour
    @tour.save
  end

private

  def params_tour
    unless params[:sub][:subcategory_id] == "Not subcategory" || params[:sub][:subcategory_id] == "Select subcategory"
      params[:tour][:category_id] = params[:sub][:subcategory_id]
      params.require(:tour).permit :name, :description, :image, :price, :place_id, :category_id, :user_id
    else
      params.require(:tour).permit :name, :description, :image, :price, :place_id, :category_id, :user_id
    end
  end
end
