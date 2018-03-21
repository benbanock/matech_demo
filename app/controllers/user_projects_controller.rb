class UserProjectsController < ApplicationController
  def create
    @user_project = UserProject.new(user_project_params)
    @user_project.project = Project.find(params[:project_id])
    @user_project.save
    authorize @user_project
    redirect_to edit_project_path(params[:project_id])
  end

  def destroy
    @user_project = UserProject.find(params[:id])
    authorize @user_project
    @user_project.destroy
    redirect_to edit_project_path(@user_project.project_id)
  end

  private

  def user_project_params
    params.require(:user_project).permit(:user_id)
  end
end
