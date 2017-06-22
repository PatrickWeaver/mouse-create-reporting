class Badge < ApplicationRecord
  self.table_name = 'badge'
  has_many :badge_project
  has_many :projects, through: :badge_project
  has_many :badge_user
  has_many :users, through: :badge_user
end
