class ItemsController < ApplicationController

  def index
    @items = policy_scope(Item)
    if params[:query].present?
      sql_query = " \
        items.name ILIKE :query \
        OR tags.name ILIKE :query \
      "
      raise
      @items = Item.joins(:tag, :taggings).where(sql_query, query: "%#{params[:query]}%")
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
    authorize @item
    @tag = Tag.new
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

  private

  def Items_params
    params.require(:item).permit(:name, :photo, :url, :tag_list)
  end
end
