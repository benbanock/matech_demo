class UserProjectsController < ApplicationController
  def create
    @user_project = UserProject.new(user_project_params)
    @user_project.save
    authorize @user_project
    redirect_to edit_project_path(params[:project_id])
  end

  private

  def user_project_params
    params.require(:user_project).permit(:user_id)
  end
end
