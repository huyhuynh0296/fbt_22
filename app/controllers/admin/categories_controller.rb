module Admin
  class CategoriesController < ApplicationController
    def index
      if is_loged_in?
        @categories = Category.category_newest.paginate page: params[:page]
      else
        flash[:danger] = t ".category_fail"
        redirect_to login_path
      end
    end
  end
end
