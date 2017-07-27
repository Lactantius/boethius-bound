class ProjectsController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @projects = @user.projects
  end

  def show
    @project = Project.find(params[:id])
  end
  
  def new
    @project = Project.new(user_id: current_user.id)
  end

end
