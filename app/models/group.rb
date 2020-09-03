class Group < ApplicationRecord
  belongs_to :service
  has_one :leader_group
  has_many :member_groups
  has_one :date_group
  has_many :payments
end
