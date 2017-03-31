class User < ApplicationRecord
  has_one :profile
  has_many :site_user
  has_many :sites, through: :site_user
  has_one :role_user
  has_one :role, through: :role_user
end
