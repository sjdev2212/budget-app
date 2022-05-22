class CategoriesController < ApplicationController
  def index
    @categories = Category.where(user_id: current_user.id)
  end

  def new
    @category = Category.new
  end

  def create
    category = current_user.categories.new(cat_params)
    if category.save
      redirect_to categories_path
      flash[:success] = 'The category was saved successfully!'
    else
      redirect_to new_category_path
      flash[:error] = 'ERROR! The category could not be saved.'
    end
  end

  private

  def cat_params
    params.require(:category).permit(:name, :icon)
  end
end
