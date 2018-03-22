class ProjectItemsController < ApplicationController
  def create
    @project_item = ProjectItem.new(project_item_params)
    authorize @project_item
    @project_item.item = Item.find(params[:item_id])
    @project_item.save
    redirect_to item_path(params[:item_id])
  end

  private

  def project_item_params
    params.require(:project_item).permit(:project_id)
  end
end
