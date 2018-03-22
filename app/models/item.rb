class Item < ApplicationRecord
  has_many :project_items, dependent: :destroy
  acts_as_taggable_on :tags
  acts_as_votable
  include PgSearch
  pg_search_scope :global_search, {
    against: [ :name ],
    associated_against: {
      tags: [ :name ]
    }
  }
end
