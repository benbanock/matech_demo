class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    @project = Project.new
    @projects = policy_scope(Project).order(created_at: :desc)
  end

  def create
    @project = Project.new(project_params)
    authorize @project
    @project.save
    redirect_to edit_project_path(@project)
  end

  def edit
    @project = Project.find(params[:id])
    @users = User.all
    # @users = @project.users
    @user_project = UserProject.new
    authorize @project
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    authorize @project
    redirect_to projects_path
  end

  def destroy
    @project = Project.find(params[:id])
    authorize @project
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :date, :status)
  end
end
