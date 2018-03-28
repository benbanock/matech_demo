class ProjectsController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index

  def index
    @project = Project.new
    @projects = current_user.projects
  end

  def favorites
    @project = Project.new
    authorize @project
    @projects = current_user.projects.where(status: "favorite")
  end

  def recent
    @project = Project.new
    authorize @project
    @projects = current_user.projects
  end

  def create
    @project = Project.new(project_params)
    @project.date = Time.now
    authorize @project
    if !@project.save
      return redirect_to projects_path
    end
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
    @user_project = UserProject.new
    authorize @project
  end

  def update
    @project = Project.find(params[:id])
    authorize @project
    @tag = Tag.where(name: @project.name).first
    @project.date = Time.now
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

  def mailtoclient
    @project = Project.find(params[:project_id])
    authorize @project
    UserMailer.welcome(@project).deliver_now
    # @user = User.invite!(email: @project.client_email) #to send email invitation with Devise Invitable
    # UserProject.create(project: @project, user: @user) #to send email invitation with Devise Invitable
    redirect_to project_path(@project)
  end

  private

  def project_params
    params.require(:project).permit(:name, :date, :status, :client_first_name, :client_last_name, :client_email)
  end
end
