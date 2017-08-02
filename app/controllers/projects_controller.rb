class ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_project, only: [:show, :destroy]

  def index
    @user = current_user
    @projects = @user.projects
  end

  def show
    set_project_id @project # This feels like the wrong way.
  end
  
  def new
    @project = Project.new
  end

  def create
    @user = current_user
    @project = @user.projects.build(project_params)
    if @project.save
      redirect_to @project, notice: 'Project saved successfully.'
      set_project_id @project
    else
      render :new, notice: 'Project failed to save.'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project deleted.'
  end
  
  private
  
    def project_params
      params.require(:project).permit(:user_id, :name)
    end

    def set_project
      @project = Project.find(params[:id])
    end

    def set_project_id project
      session[:project_id] = project.id
    end

end
