class NokogiriImageScrappingJob < ApplicationJob
  queue_as :default

  def perform(resource_id)
    resource = Resource.find(resource_id)
    attach_cloudinary_img(resource)
  end

  private

  def img_url(url)
    return if Nokogiri::HTML(open(url)).css("meta[property='og:image']").blank?
    Nokogiri::HTML(open(url)).css("meta[property='og:image']").first.attributes["content"].value
  end

  def attach_cloudinary_img(resource)
    img = img_url(resource.url)
    return if img.nil?

    file = URI.open(img)
    resource.photo.attach(io: file, filename: resource.title, content_type: 'image/png')
  end
end
