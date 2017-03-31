class User < ApplicationRecord
  has_one :profile
  has_many :site_user
  has_many :sites, through: :site_user
  has_one :role_user
  has_one :role, through: :role_user
  has_many :evidence
  has_many :collaborations
  has_many :collaborators, through: :collaborations, foreign_key: :user_id
  has_many :group_user
  has_many :groups, through: :group_user
end
