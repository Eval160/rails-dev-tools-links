class Favorite < ApplicationRecord
  belongs_to :resource
  belongs_to :user
  validates :user_id, uniqueness: { scope: :resource_id }
end
