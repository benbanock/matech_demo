class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    @projects = policy_scope(Project).order(created_at: :desc)
  end

  def create
    @project = Project.new(project_params)
    authorize @project
    @project.save
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :date, :status)
  end
end
