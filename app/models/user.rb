class User < ApplicationRecord
  has_one :profile
  has_many :sites, through: :site_users
end
