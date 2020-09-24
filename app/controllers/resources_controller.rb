class ResourcesController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @resources = Resource.includes(:categories, photo_attachment: :blob)
    p = params["/resources"]
    if !params["/resources"].nil? && p[:category].length != 1 && p[:category]
      resources = Resource.joins(:category_tags).includes(:categories, photo_attachment: :blob).where(category_tags: { category: p[:category] })
      @resources = resources.uniq
    end
  end

  def show
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.user = current_user
    if @resource.photo.present? && @resource.save
      redirect_to resources_path
    elsif @resource.valid?
      @resource.save
      NokogiriImageScrappingJob.perform_later(@resource.id)
      redirect_to resources_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @resource.update(resource_params)
      redirect_to resources_path
    else
      render :edit
    end
  end

  def destroy
    @resource.destroy
    redirect_to resources_path
  end

  def user_resources
    @resources = current_user.resources.includes(:categories, photo_attachment: :blob)
  end

  private

  def set_params
    @resource = Resource.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:title, :description, :url, :photo, category_ids: [], categories_attributes: [:name])
  end
end
