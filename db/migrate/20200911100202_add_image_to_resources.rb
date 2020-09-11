class AddImageToResources < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :image, :string
  end
end
