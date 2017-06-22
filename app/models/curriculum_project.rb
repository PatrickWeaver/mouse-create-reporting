class CurriculumProject < ApplicationRecord
  belongs_to :project
  belongs_to :curricula, foreign_key: :curriculum_id
end
