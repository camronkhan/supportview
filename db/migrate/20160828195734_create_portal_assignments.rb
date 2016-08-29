class CreatePortalAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :portal_assignments do |t|
      t.string :condition
      t.references :request, foreign_key: true
      t.references :product, foreign_key: true
      t.references :portal, foreign_key: true

      t.timestamps
    end
  end
end
