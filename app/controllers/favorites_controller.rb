class FavoritesController < ApplicationController
  def create
    @resource = Resource.find(params[:resource_id])
    @favorite = Favorite.new(user: current_user, resource: @resource)
    redirect_to resource_path(@resource) if @favorite.save
  end
end
