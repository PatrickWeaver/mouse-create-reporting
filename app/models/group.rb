class Group < ApplicationRecord
  has_many :evidence
  has_many :group_user
  has_many :users, through: :group_user
  belongs_to :site
end
