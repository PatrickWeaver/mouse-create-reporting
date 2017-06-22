class BadgeProject < ApplicationRecord
  belongs_to :project, foreign_key: :project_id
  belongs_to :badge, foreign_key: :badge_id
end
