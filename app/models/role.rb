class Role < ApplicationRecord
  has_many :role_user
  has_many :users, through: :role_user
end
