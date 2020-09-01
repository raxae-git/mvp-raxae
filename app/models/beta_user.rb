class BetaUser < ApplicationRecord
  has_many :member_groups
  has_many :leader_groups
  has_many :group_dates

  after_create :send_confirmation

  private

  def send_confirmation
    LeadMailer.with(lead: self).confirmation.deliver_later!
  end
end
