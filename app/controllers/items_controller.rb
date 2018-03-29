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
    @good_projects = Project.good_projects(current_user, @item)
  end

  def create_ext
    item_url = params[:item_url]
    item_title = params[:item_title]
    image_url = params[:image_url]
    project_id = params[:project_id]
    @item = Item.create(photo: image_url, url: item_url, name: item_title )
    @item.tag_list.add("inspiration") if project_id == "-1"
    @project_item = ProjectItem.create(project_id: project_id, item_id: @item.id)
    tags = params[:tags]
    tags.each do |tag|
      @item.tag_list.add(tag)
      @item.save
    end
    diffbot(item_url, @item)
    @item.tag_list.add(@item.price)
    @item.save
    render json: {
      status: "ok",
      price: @item.price
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

  def good_projects
    item = @item
    @good_projects = []
    current_user.projects.each do |project|
      user_project_items = project.project_items
      if user_project_items.all? {|user_project_item| ! user_project_item.item.id == item.id}
        @good_projects << project
      end
    end
  end

  def diffbot(item_url, item)
    require 'json'
    url = "https://api.diffbot.com/v3/product?token=ed2e20097a61a422366d9238ecfa8086&url=""#{item_url}"
    url = url.gsub(/\/\?.*/,"")
    data_serialized = open(url).read
    data = JSON.parse(data_serialized)
    if data["objects"]
      price = data["objects"][0]["offerPrice"]
      item.price = price
      item.save
    else
      item.price = "no price"
    end
  end

end
