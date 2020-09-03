class CreateDeletedGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :deleted_groups do |t|
      t.string :name
      t.references :service, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true
      t.integer :id_deleted

      t.timestamps
    end
  end
end
