class ResourcesController < ApplicationController
  require "open-uri"
  require "nokogiri"

  before_action :set_params, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @resources = Resource.all
    p = params["/resources"]
    if !params["/resources"].nil? && p[:category].length != 1 && p[:category]
      @resources = Resource.joins(:category_tags).where(category_tags: { category: p[:category] })
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
      attach_cloudinary_img(@resource)
      @resource.save
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

  private

  def set_params
    @resource = Resource.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:title, :description, :url, :photo, category_ids: [], categories_attributes: [:name])
  end

  def img_url(url)
    if Nokogiri::HTML(open(url)).css("meta[property='og:image']").blank?
      nil
    else
      Nokogiri::HTML(open(url)).css("meta[property='og:image']").first.attributes["content"].value
    end
  end

  def attach_cloudinary_img(resource)
    img = img_url(resource.url)
    return if img.nil?

    file = URI.open(img)
    resource.photo.attach(io: file, filename: resource.title, content_type: 'image/png')
  end
end
