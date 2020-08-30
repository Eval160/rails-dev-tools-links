class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :title
      t.text :description
      t.string :url
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
