class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @resource = Resource.new
    @category = Category.new(params_category)
    if @category.save
      render new_resource_path
    else
      render "resources/new"
    end
  end

  private

  def params_category
    params.require(:category).permit(:name)
  end
end
