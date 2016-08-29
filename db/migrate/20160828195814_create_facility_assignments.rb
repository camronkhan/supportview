class CreateFacilityAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :facility_assignments do |t|
      t.string :condition
      t.references :request, foreign_key: true
      t.references :product, foreign_key: true
      t.references :facility, foreign_key: true

      t.timestamps
    end
  end
end
