class CreateLeaderGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :leader_groups do |t|
      t.references :beta_user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
