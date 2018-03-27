class Project < ApplicationRecord
  has_many :project_items, dependent: :destroy
  has_many :user_projects, dependent: :destroy
  has_many :items, through: :project_items
  has_many :users, through: :user_projects

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, too_short: "please enter at least 3 characters"}
end
