class CreateBetaUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :beta_users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :messaging_service
      t.string :service_of_interest

      t.timestamps
    end
  end
end
