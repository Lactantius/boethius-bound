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
    @user = current_user
    # @project = Project.new(user_id: current_user.id)
    @project = @user.projects.build(project_params)
  end

  def create
    @user = current_user
    # @project = Project.new(user_id: current_user.id)
    @project = @user.projects.build(project_params)
    if @project.save
      redirect_to @project, notice: 'Project saved successfully.'
    else
      render :new, notice: 'Project failed to save.'
    end
  end

  private
  
    def project_params
      params.require(:project).permit(:user_id, :name)
    end

end
