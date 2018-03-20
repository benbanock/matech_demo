class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item)
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    authorize @item
    @tag = Tag.new
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end


  def Items_params
    params.require(:item).permit(:name, :photo, :url, :tag_list)
  end
end
