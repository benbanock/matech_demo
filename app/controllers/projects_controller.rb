class ProjectsController < ApplicationController

  def index
    @project = Project.new
    @projects = policy_scope(Project).order(created_at: :desc)

  end

  def create
    @project = Project.new(project_params)
    @project.date = Date.today
    authorize @project
    @project.save
    redirect_to edit_project_path(@project)
  end

  def edit
    @project = Project.find(params[:id])
    @users = @project.users
    @user_project = UserProject.new
    authorize @project
  end

  def update
    @project = Project.find(params[:id])
    authorize @project
    @project.date = Date.today
    @project.update(project_params)
    redirect_to edit_project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    authorize @project
    @project.destroy
    redirect_to projects_path
  end

  def show
    @project = Project.find(params[:id])
    # @project_items = ProjectItem.all
    # @items = @project_items
    authorize @project
  end

  #SELECT / FILTER

  def like
    @project = Project.find(params[:id])
    authorize @project
    @project.liked_by current_user
    redirect_to projects_path
  end

  def dislike
    @project = Project.find(params[:id])
    authorize @project
    @project.disliked_by current_user
    redirect_to projects_path
  end


  private

  def project_params
    params.require(:project).permit(:name, :date, :status)
  end
end
