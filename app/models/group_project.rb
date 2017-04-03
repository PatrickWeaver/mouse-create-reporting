class GroupProject < ApplicationRecord
  self.table_name = 'group_project'
  belongs_to :group
  belongs_to :project
end
