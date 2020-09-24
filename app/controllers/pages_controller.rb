class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
  end

  def download
    @api_key = current_user.authentication_token
  end

  def about
  end
end
