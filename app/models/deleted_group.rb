class DeletedGroup < ApplicationRecord
  has_many :deleted_member
  belongs_to :service
  belongs_to :payment
end
