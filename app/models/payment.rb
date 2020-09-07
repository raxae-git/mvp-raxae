class Payment < ApplicationRecord
  belongs_to :member_group
  belongs_to :deletd_member
  belongs_to :leader_group
end
