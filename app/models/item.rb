class Item < ApplicationRecord
  has_many :project_items, dependent: :destroy
  acts_as_taggable_on :tags
  acts_as_votable
  include PgSearch
    pg_search_scope :search_by_name_and_tags,
      against: [ :name, :tags ],
      using: {
        tsearch: { prefix: true } # <-- now `superman batm` will return something!
      }
end
