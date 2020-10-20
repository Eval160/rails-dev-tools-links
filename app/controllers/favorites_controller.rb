class FavoritesController < ApplicationController
  def create
    @resource = Resource.find(params[:resource_id])
    @favorite = Favorite.create!(user: current_user, resource: @resource)

    respond_to do |format|
      format.html { redirect_to resources_path }
      format.js
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @resource = @favorite.resource
    @favorite.destroy

    respond_to do |format|
      format.html { redirect_to resources_path }
      format.js
    end
  end

  def index
    @favorites = Favorite.includes(resource: [{photo_attachment: :blob}, :categories, :user]).where(user: current_user)
  end
end
