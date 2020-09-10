class CreateCountUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :count_users do |t|

      t.timestamps
    end
  end
end
