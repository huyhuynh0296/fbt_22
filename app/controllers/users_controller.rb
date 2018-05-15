class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "users.flash.errorshow"
    redirect_to signup_path
  end

  def new
    @user = User.new
  end
end
