class SiteUser < ApplicationRecord
  self.table_name = 'site_user'
  belongs_to :site
  belongs_to :user
end
