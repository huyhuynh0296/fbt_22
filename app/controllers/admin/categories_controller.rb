module Admin
  class CategoriesController < ApplicationController
    before_action :find_category, only: %i(destroy update delete)
    before_action :find_category_deleted, only: :restore

    def index
      @categories = Category.category_newest.paginate page: params[:page]
    end

    def deleted_category
      @categorydeleted = Category.only_deleted.category_newest.paginate page: params[:page]
    end

    def destroy
      render json: {
        status: delete_category_item(@category)
      }
    end

    def delete
      render json: {
        status: delete_category_item(@category)
      }
    end

    def restore
      if @category && @category.restore
        flash[:success]= "Restored successfully category #{@category.name} !"
        redirect_to admin_categories_deleted_url
      else
        flash[:error]= "Don't restore successfully category #{@category.name} !"
        redirect_to admin_categories_deleted_url
      end
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
          return flash[:success]= "deleted successfully category #{category.name}!" if category.destroy
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

    def find_category_deleted
      @category = Category.only_deleted.find_by id: params[:id]
    end

    def restore_category category
      if category.restore
        render json: {success: true, response_text: t(".success")}
      end
    end
  end
end

