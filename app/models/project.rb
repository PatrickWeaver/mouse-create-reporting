class Project < ApplicationRecord
  has_many :evidence
  has_many :group_project
  has_many :groups, through: :group_project
  has_many :curriculum_project
  has_many :curriculas, through: :curriculum_project, :source => :curricula
end
