class Collaboration < ApplicationRecord
  self.table_name = 'evidence_user'
  belongs_to :evidence
  belongs_to :user
end
