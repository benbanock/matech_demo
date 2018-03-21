class Item < ApplicationRecord
  has_many :project_items
  acts_as_taggable_on :tags
  acts_as_votable
end
