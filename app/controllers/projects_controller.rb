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
    @tag = Tag.new
    @tag.name = @project.name
    @tag.save
    @user_project = UserProject.new(project: @project, user: current_user)
    if @user_project.save
      redirect_to edit_project_path(@project)
    else
      render :index
    end
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
    @tag = Tag.where(name: @project.name).first
    @project.date = Date.today
    @project.update(project_params)
    @tag.name = @project.name
    @tag.save
    redirect_to edit_project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @tag = Tag.where(name: @project.name).first
    authorize @project
    @project.destroy
    @tag.destroy
    redirect_to projects_path
  end

  def show
    @project = Project.find(params[:id])
    @items = @project.items
    authorize @project
  end

  private

  def project_params
    params.require(:project).permit(:name, :date, :status)
  end
end
