class TagsController < ApplicationController
  def index
    @items = policy_scope(Item)
    @tags = ActsAsTaggableOn::Tag.all
  end

  def create
    if params[:item_id]
      @item = Item.find(params[:item_id])
      authorize @item
      @item.tag_list.add(tag_params[:name])
      @item.save
      redirect_to item_path(@item)
    else
      @tag = Tag.new(tag_params)
      authorize @tag
      if @tag.save
        respond_to do |format|
          format.html { redirect_to tags_path }
          format.js
        end
      else
        render 'tags/index'
      end
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    authorize @item
    @tag = Tag.find(params[:id])
    @item.tag_list.remove(@tag.name)
    if @item.save
      respond_to do |format|
        format.html { redirect_to item_path(@item) }
        format.js
      end
    end
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
