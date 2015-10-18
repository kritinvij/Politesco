class CreateItems < ActiveRecord::Migration
  def change
    create_table :items, id: false do |t|
      t.string :thumbnail
      t.primary_key :permalink
      t.string :url
      t.string :title
      t.text :description
    end
  end
end
