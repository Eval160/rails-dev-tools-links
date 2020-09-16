class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||resources_path
  end

  def after_sign_out_path_for(resource)
    stored_location_for(resource) ||resources_path
  end
end
