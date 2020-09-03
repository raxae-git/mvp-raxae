class CreateDeletedBetaUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :deleted_beta_users do |t|
      t.string :name
      t.date :entry_date
      t.date :departure_date
      t.string :reason
      t.string :email

      t.timestamps
    end
  end
end
