class AddMemberGroupsAndLeaderGroupsToGroups < ActiveRecord::Migration[6.0]
  def change
    add_reference :groups, :leader_group, null: false, foreign_key: true
    add_reference :groups, :member_group, null: false, foreign_key: true
  end
end
