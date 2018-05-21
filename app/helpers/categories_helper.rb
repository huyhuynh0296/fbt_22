module CategoriesHelper
  def check_category_parent id
    return true if (Category.categories_include id).size.zero?
  end
end
