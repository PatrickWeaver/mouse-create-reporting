class GroupUser < ApplicationRecord
  self.table_name = 'group_user'
  belongs_to :group
  belongs_to :user
end
