class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :website_url

      t.timestamps
    end

    add_index :companies, :name, unique: true
  end
end
