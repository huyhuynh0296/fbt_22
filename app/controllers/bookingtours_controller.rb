class BookingtoursController < ApplicationController
  before_action :find_bookingtour, only: %i(destroy update)
  before_action :find_booking_finished, only: :destroy_finished
  before_action :authenticate_user!
  before_action :find_to_edit
  before_action :find_in_booking, only: %i(update index)

  def new
    @bookingtour = Bookingtour.new
  end

  def index
    unless params[:tour_id].blank?
      @tour = Tour.find_by id: params[:tour_id]
      @place = @tour.place
    else redirect_to bookingtours_show_url
    end
  end

  def create
    @bookingtour = Bookingtour.new params_bookingtour
    if @bookingtour.save
      flash[:success] = "Booking success!"
      redirect_to bookingtours_show_url
    else
      flash[:danger] = "Booking fail!"
      redirect_to bookingtours_show_url
    end
  end

  def show
    if admin? current_user
      @bookingtour = Bookingtour.all
      @tour_finished = Bookingtour.search_booked_finished 3
    elsif users? current_user
      @bookingtour = Bookingtour.search_by_user current_user.id
    end
  end

  def update
    render "bookingtours/update_form"
  end

  def destroy
    @bookingtourdel = Bookingtour.find_by id: params[:id]
    redirect_to bookingtours_show_url if @bookingtourdel.destroy
  end

  def destroy_finished
    return redirect_to bookingtours_show_url if params[:count_del] == 0 || params[:count].blank?
    if @booking_finished.destroy
      flash[:success] = "success!"
    else
      flase[:danger] = "fail!"
    end
  end

  def bookingtour_by_id id_book
    @booking = Bookingtour.find_by id: id_book
  end

  private

  def params_bookingtour
    params.require(:bookingtour).permit :tour_id, :price, :amount_persion, :status, :datetour_id , :user_id
  end

  def find_bookingtour
    @bookingtourdel = Bookingtour.find_by id: params[:id]
  end

  def find_booking_finished
    @booking_finished = Bookingtour.search_booked_finished 3
  end

  def find_to_edit
    if admin?(current_user) || manage?(current_user)
      @bookingtour = Bookingtour.all
      @tour_finished = Bookingtour.search_booked_finished 3
    elsif users? current_user
      @bookingtour = Bookingtour.search_by_user current_user.id
    end
  end

  def find_in_booking
    @date = Datetour.find_date
    @peopletour = Peopletour.all
  end
end
