class ProjectItem < ApplicationRecord
  belongs_to :item
  belongs_to :project
end
