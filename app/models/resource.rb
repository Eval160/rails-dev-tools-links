class Resource < ApplicationRecord
  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  has_many :category_tags, dependent: :destroy
  has_many :categories, through: :category_tags
  has_one_attached :photo
  accepts_nested_attributes_for :categories, reject_if: proc { |attributes| attributes['name'].blank? }
  validates :url, url: true, presence: true, uniqueness: true
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
end
