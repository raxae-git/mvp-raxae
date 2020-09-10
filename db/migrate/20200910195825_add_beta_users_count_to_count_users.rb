class AddBetaUsersCountToCountUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :count_users, :beta_users_count, :integer
  end
end
