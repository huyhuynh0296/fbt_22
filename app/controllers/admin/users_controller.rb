class Admin::UsersController < ApplicationController
  before_action :load_user, online: %i(index show)
  before_action :logged_in_user
  before_action :find_user, only: %i(destroy)

  def index
    @users = User.role_user(0).paginate page: params[:page]
  end

  def destroy
    if @user_del.destroy
      flash[:succes] = "succes!"
      redirect_to admin_users_url
    else
      flash[:danger] = "error!"
      redirect_to admin_users_url
    end
  end

  private

  def find_user
    @user_del = User.find_by id: params[:id]
  end
end
