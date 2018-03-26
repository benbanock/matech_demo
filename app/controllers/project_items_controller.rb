class ProjectItemsController < ApplicationController
  def create
    @project_item = ProjectItem.new(project_item_params)
    @project = Project.find(@project_item.project_id)
    authorize @project_item
    @project_item.item = Item.find(params[:item_id])
    @project.date = Time.now
    @project_item.save
    @project.save
    redirect_to item_path(params[:item_id])
  end

  def destroy
    @item = Item.find(params[:item_id])
    @project_item = ProjectItem.find(params[:id])
    authorize @project_item
    @project_item.destroy
    redirect_to item_path(@item)
  end

  private

  def project_item_params
    params.require(:project_item).permit(:project_id)
  end
end
