class LeaderGroup < ApplicationRecord
  belongs_to :beta_user
  belongs_to :group
  has_many :payments
end
