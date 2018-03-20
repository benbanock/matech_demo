class TagsController < ApplicationController
  def index
    @items = policy_scope(Item)
    @tags = ActsAsTaggableOn::Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    @item = Item.find(params[:item_id])
    authorize @tag
    if @tag.save
      redirect_to item_path(item_id)
    else
      render :new
    end
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
