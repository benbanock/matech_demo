class ProjectItemsController < ApplicationController
  def create
    @project_item = ProjectItem.new(project_item_params)
    @project = Project.find(@project_item.project_id)
    authorize @project_item
    @project_item.item = Item.find(params[:item_id])
    @project.date = Time.now
    @project.save
    if @project_item.save
      respond_to do |format|
        format.html { redirect_to item_path(params[:item_id]) }
        format.js
      end
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @project_item = ProjectItem.find(params[:id])
    authorize @project_item
    if @project_item.destroy
      respond_to do |format|
        format.html { redirect_to item_path(@item) }
        format.js
      end
    end
  end

  private

  def project_item_params
    params.require(:project_item).permit(:project_id)
  end
end
