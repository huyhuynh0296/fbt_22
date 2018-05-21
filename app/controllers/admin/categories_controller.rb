module Admin
  class CategoriesController < ApplicationController
    before_action :load_user, online: %i(index show)
    before_action :find_category, only: %i(destroy update)

    def index
      @categories = Category.category_newest.paginate page: params[:page]
    end

    def destroy
      render json: {
        status: delete_category_item(@category)
      }
    end

    def update
      if @category && @category.update_attributes(name: params[:name])
        render json: {success: true, response_text: t(".success")}
      else
        render json: {success: false, response_text: t(".fail")}
      end
    end

    def show_tour
      @documents = Document.search_category(params[:id]).paginate page: params[:page]
      render partial: "show_tour"
    end

private

    def delete_category_item category
      if @category && @category.tours.size.zero?
        if check_category_parent(category.id)
          return flash[:success]= "deleted successfully category #{category.name}!" if @category.destroy
          # flash[:error] = "Can't delete category #{category.name} !"
        else
          flash[:error]= "category #{category.name} are containing subcategories !"
        end
      else
        flash[:error]= "Can't delete category #{category.name} !"
      end
    end

    def find_category
      @category = Category.find_by id: params[:id]
    end

    def category_destroy category
      return unless category.destroy
      render json: {success: true, response_text: t(".success")}
    end
  end
end

