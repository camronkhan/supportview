class CreateModelNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :model_numbers do |t|
      t.string :model
      t.string :description
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
