class Item < ApplicationRecord
  has_many :project_items
  acts_as_votable
end
