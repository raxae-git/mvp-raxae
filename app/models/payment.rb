class Payment < ApplicationRecord
  belongs_to :member_group
  belongs_to :leader_group
end
