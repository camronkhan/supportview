class CreateAgents < ActiveRecord::Migration[5.0]
  def change
    create_table :agents do |t|
      t.string :skill, null: false
      t.string :team, null: false
      t.string :support_center, null: false
      t.string :region, null: false
      t.string :workgroup, null: false
      t.string :phone, null: false

      t.timestamps
    end
  end
end
