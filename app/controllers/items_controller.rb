class ItemsController < ApplicationController
  def index
      @items = policy_scope(Item)
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

end
