class CreateAgentAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :agent_assignments do |t|
      t.string :condition
      t.references :request, foreign_key: true
      t.references :product, foreign_key: true
      t.references :agent, foreign_key: true

      t.timestamps
    end
  end
end
