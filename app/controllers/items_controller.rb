class ItemsController < ApplicationController
  skip_after_action :verify_authorized, only: :create_ext
  skip_before_action :authenticate_user!, only: :create_ext
  skip_before_action :verify_authenticity_token, only: :create_ext

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
    p params
    p current_user
    # request.body
    item_url = params[:item_url],
    item_title = params[:item_title]
    images_url = params[:images_url]
    @item = Item.create(photo: "images_url",url: item_url, name: item_title )

    render json: {
      status: 200
    }
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
    if @item.liked_by current_user
      respond_to do |format|
        format.html { redirect_to items_path }
        format.js
      end
    end
  end

  def dislike
    @item = Item.find(params[:id])
    authorize @item
    if @item.disliked_by current_user
      respond_to do |format|
        format.html { redirect_to items_path }
        format.js
      end
    end
  end

  private

  def Items_params
    params.require(:item).permit(:name, :photo, :url, :tag_list)
  end
end
