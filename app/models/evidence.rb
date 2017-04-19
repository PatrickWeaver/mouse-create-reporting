class Evidence < ApplicationRecord
  self.table_name = 'evidence'
  belongs_to :user
  belongs_to :group
  belongs_to :project
  has_many :collaborations
  has_many :collaborators, through: :collaborations, :source => :user
end
