class Resource < ApplicationRecord
  belongs_to :user, optional: true
  validates :url, url: true
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
end
