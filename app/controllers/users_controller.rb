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

  def create
    @user = User.new params_user
    save_user
  end

  private

  def save_user
    if @user.save
      log_in @user
      flash[:success] = t "users.new.create_success"
      redirect_to root_url
    else
      render :new
    end
  end

  def params_user
    params.require(:user).permit :name, :email, :password, :password_confirmation, :avatar, :role
  end
end
