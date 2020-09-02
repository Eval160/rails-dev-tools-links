class Category < ApplicationRecord
  has_many :category_tags, dependent: :destroy
  has_many :resources, through: :category_tags
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
