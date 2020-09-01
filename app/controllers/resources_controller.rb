class ResourcesController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
    @resources = Resource.all
  end

  def show
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      create_category_tag
      redirect_to resources_path
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @resource.update(resource_params)
      CategoryTag.where(resource: @resource).destroy_all
      create_category_tag
      redirect_to resource_path(@resource)
    else
      render :edit
    end
  end

  def destroy
    @resource.destroy
    redirect_to resources_path
  end

  private

  def set_params
    @resource = Resource.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:title, :description, :url)
  end

  def create_category_tag
    params[:resource][:category_ids].each do |category_id|
      CategoryTag.create(category: Category.find(category_id), resource: @resource) unless category_id.empty?
    end
  end
end
