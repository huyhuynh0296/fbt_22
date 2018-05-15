module Admin
  class CategoriesController < ApplicationController
    before_action :load_user, online: %i(index show)
    before_action :find_category, only: %i(destroy)

    def index
      @categories = Category.category_newest.paginate page: params[:page]
    end

    def destroy
      unless @categorydel.blank?
        unless @categorydel.destroy
          flash[:danger] = "error!"
          redirect_to admin_categories_url
        else
          flash[:succes] = "succes!"
          redirect_to admin_categories_url
        end
      else
        flash[:danfer] = "error!"
        redirect_to admin_categories_url
      end
    end

    def show_tour
      @documents = Document.search_category(params[:id]).paginate page: params[:page]
      render partial: "show_tour"
    end

    private

    def find_category
      unless params[:id].blank?
        @categorydel = User.find_by id: params[:id]
      else
        flash[:danger] = "Not find category!"
        redirect_to admin_categories_url
      end
    end

    def find_tour_in_category
    end
  end
end

