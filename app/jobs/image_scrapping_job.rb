class ImageScrappingJob < ApplicationJob
  queue_as :default

  require "open-uri"

  def perform(resource, photo_url)
    photo = URI.open(photo_url)
    resource.photo.attach(io: photo, filename: "Image du site #{resource.title}", content_type: 'image/png')
  end

end



