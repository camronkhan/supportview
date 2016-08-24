class CreateSources < ActiveRecord::Migration[5.0]
  def change
    create_table :sources do |t|
      t.string :location, null: false

      t.timestamps
    end

    add_index :sources, :location, unique: true
  end
end
