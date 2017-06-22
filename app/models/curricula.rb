class Curricula < ApplicationRecord
  self.table_name = 'curricula'
  has_many :curriculum_project
  has_many :projects, through: :curriculum_project, :source => :project
end
