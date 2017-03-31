class Site < ApplicationRecord
  has_many :users, through: :site_users
end
