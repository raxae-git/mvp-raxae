class BetaUser < ApplicationRecord
  has_many :member_groups
  has_many :leader_groups
  has_many :group_dates
  has_many :deleted_members
  belongs_to :count_user, counter_cache: true

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :messaging_service, presence: true
  validates :service_of_interest, presence: true

  # after_create :send_confirmation

  # private

  # def send_confirmation
  #   LeadMailer.with(lead: self).confirmation.deliver_later!
  # end
end
