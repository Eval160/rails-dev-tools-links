class Api::V1::ResourcesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, only: [ :create ]
  before_action :set_resource, only: [ :show ]

  def show
  end

  def create
    @resource = Resource.new(resource_params)
    photo_url = photo_params[:imgUrl]
    @resource.user = current_user
    authorize @resource
    if @resource.save
      if photo_url != ""
        ImageScrappingJob.perform_later(@resource, photo_url)
      end
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
