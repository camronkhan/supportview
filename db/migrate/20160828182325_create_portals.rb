class CreatePortals < ActiveRecord::Migration[5.0]
  def change
    create_table :portals do |t|
      t.string :name
      t.string :website_url
      t.string :description

      t.timestamps
    end
  end
end
