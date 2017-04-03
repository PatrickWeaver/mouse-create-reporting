class NetworkSite < ApplicationRecord
  self.table_name = 'network_site'
  belongs_to :network
  belongs_to :site
end
