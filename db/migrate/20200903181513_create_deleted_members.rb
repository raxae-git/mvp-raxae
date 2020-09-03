class CreateDeletedMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :deleted_members do |t|
      t.string :name
      t.references :group, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true
      t.boolean :leader
      t.string :reason
      t.date :entry_date
      t.date :departure_date

      t.timestamps
    end
  end
end
