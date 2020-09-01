class CategoryTag < ApplicationRecord
  belongs_to :category
  belongs_to :resource
  validates :category, uniqueness: { scope: :resource }
end
