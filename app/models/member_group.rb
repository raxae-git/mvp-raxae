class MemberGroup < ApplicationRecord
  belongs_to :beta_user
  belongs_to :group
end
