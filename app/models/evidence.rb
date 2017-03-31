class Evidence < ApplicationRecord
  self.table_name = 'evidence'
  belongs_to :user
  belongs_to :group
  has_many :collaborations
  has_many :collaborators, through: :collaborations, foreign_key: :user_id
end
