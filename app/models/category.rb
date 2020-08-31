class Category < ApplicationRecord
  has_many :category_tags, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
