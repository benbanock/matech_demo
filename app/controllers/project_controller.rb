class ProjectController < ApplicationController

  def index
    @projects = policy_scope(Project).order(created_at: :desc)
  end

  def create
    authorize @project
  end
end
