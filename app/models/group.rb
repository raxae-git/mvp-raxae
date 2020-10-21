class Group < ApplicationRecord
  belongs_to :service, inverse_of: :groups
  has_one :leader_group
  has_many :member_groups
  has_many :payments

  accepts_nested_attributes_for :leader_group, :member_groups, allow_destroy: true
end
