class LeaderGroup < ApplicationRecord
  belongs_to :beta_user
  belongs_to :group
  has_many :payments
  has_one :group_date
end
