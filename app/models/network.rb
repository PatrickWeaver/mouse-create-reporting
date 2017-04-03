class Network < ApplicationRecord
  has_many :network_sites
  has_many :sites, through: :network_sites
end
