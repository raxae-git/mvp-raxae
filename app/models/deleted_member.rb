class DeletedMember < ApplicationRecord
  belongs_to :group
  has_many :payments
  belongs_to :deleted_group
  belongs_to :deleted_beta_user
  belongs_to :beta_user
end
