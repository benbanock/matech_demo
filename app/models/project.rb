class Project < ApplicationRecord
  has_many :project_items
  has_many :items, through: :project_items
  has_many :users

  validates :name, presence: true, uniqueness: true
end
