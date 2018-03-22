class ItemsController < ApplicationController

  def index
    @items = policy_scope(Item)
    if params[:query].present?
      @items = params[:query].map { |query| Item.global_search("%#{query}%")}.inject(:&)
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @project_item = ProjectItem.new
    authorize @item
    @tag = Tag.new
  end

  def create_ext
    # params
    # request.body
    binding.remote_pry

    # data.item_url: item_url,
    # data.item_title: item_title,
    # data.image_url: image_url,
    # data.user_id: user_id,
    # data.project_id: project_id,
    # data.comment: comment

    @item = Item.find(params[])
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
