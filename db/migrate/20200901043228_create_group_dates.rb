class CreateGroupDates < ActiveRecord::Migration[6.0]
  def change
    create_table :group_dates do |t|
      t.integer :expiration_day
      t.date :entry_date
      t.integer :date_transfer
      t.integer :charge_day
      t.references :group, null: false, foreign_key: true
      t.references :beta_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
