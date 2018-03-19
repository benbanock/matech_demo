class Project < ApplicationRecord
  has_many :project_items
  has_many :users
end
