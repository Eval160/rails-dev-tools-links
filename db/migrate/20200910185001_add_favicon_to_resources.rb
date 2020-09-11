class AddFaviconToResources < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :favicon, :string
  end
end
