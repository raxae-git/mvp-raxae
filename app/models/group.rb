class Group < ApplicationRecord
  has_one :leader_group
  has_many :member_groups
  has_one :date_group
  has_many :payments
end
