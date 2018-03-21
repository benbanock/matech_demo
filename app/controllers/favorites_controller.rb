class FavoritesController < ApplicationController
  def index
    @items = policy_scope(Item)
    @items = current_user.likes.map { |like| Item.find(like.votable_id) }
  end
end
