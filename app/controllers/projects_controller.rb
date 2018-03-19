class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    @projects = policy_scope(Project).order(created_at: :desc)
  end

  def create
    @project = Project.new
    authorize @project
  end
end
