class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.float :value
      t.string :type
      t.date :effective_date
      t.boolean :charge
      t.references :member_group, null: false, foreign_key: true
      t.references :leader_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
