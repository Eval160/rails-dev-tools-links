class FavoritesController < ApplicationController
  def create
    @resource = Resource.find(params[:resource_id])
    @favorite = Favorite.new(user: current_user, resource: @resource)
    redirect_to resources_path if @favorite.save
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to resources_path
  end
end
