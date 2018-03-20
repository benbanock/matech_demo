class Project < ApplicationRecord
  has_many :project_items
  has_many :user_project
  has_many :items, through: :project_items
  has_many :users, through: :user_project


  validates :name, presence: true, uniqueness: true
end
