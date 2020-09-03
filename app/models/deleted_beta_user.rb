class DeletedBetaUser < ApplicationRecord
  has_many :deleted_members
end
