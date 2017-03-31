class Site < ApplicationRecord
  has_many :site_user
  has_many :users, through: :site_user
  has_many :groups
end
