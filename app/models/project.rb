class Project < ApplicationRecord
  has_many :project_items, dependent: :destroy
  has_many :user_projects, dependent: :destroy
  has_many :items, through: :project_items
  has_many :users, through: :user_projects

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, too_short: "please enter at least 3 characters"}


#   def self.not_twice_in_item(item)
#     self.all.select {|item| !item.projects.include? project}
#   end
end

