class BetaUser < ApplicationRecord
  has_many :member_groups
  has_many :leader_groups
  has_many :group_dates
end
