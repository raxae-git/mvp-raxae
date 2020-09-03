class DeletedMember < ApplicationRecord
  belongs_to :group
  belongs_to :payment
  belongs_to :deleted_group
  belongs_to :deleted_beta_user
  belongs_to :beta_user
end
