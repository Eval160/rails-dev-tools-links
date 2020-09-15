class Api::V1::ResourcesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, only: [ :create ]
  before_action :set_resource, only: [ :show ]
  require "open-uri"

  def show
  end

  def create
    @resource = Resource.new(resource_params)
    photo_url = photo_params[:imgUrl]
    if photo_url != ""
      photo = URI.open(photo_params[:imgUrl])
      @resource.photo.attach(io: photo, filename: @resource.title, content_type: 'image/png')
    end
    @resource.user = current_user
    authorize @resource
    if @resource.save
      render :show, status: :created
    else
      render_error
    end
  end


private

  def set_resource
    @resource = Resource.find(params[:id])
    authorize @resource
  end

  def resource_params
    params.require(:resource).permit(:title, :description, :url)
  end

  def photo_params
    params.require(:photo).permit(:imgUrl)
  end

  def render_error
    render json: { errors: @resource.errors.full_messages },
      status: :unprocessable_entity
  end

end
