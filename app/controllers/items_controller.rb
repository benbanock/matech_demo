class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item)
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    authorize @item
  end

  def destroy
    @item = Item.find(params[:id])
    authorize @item
    @item.destroy
    redirect_to items_path
  end

  def quickshow
    @item = Item.find(params[:item_id])
    authorize @item
  end
  def like
    @item = Item.find(params[:id])
    authorize @item
    @item.liked_by current_user
    redirect_to items_path
  end

  def dislike
    @item = Item.find(params[:id])
    authorize @item
    @item.disliked_by current_user
    redirect_to items_path
  end
end
