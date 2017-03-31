class RoleUser < ApplicationRecord
  self.table_name = 'role_user'
  belongs_to :user
  belongs_to :role
end
