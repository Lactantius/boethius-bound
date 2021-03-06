class ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_project, only: [:show, :update, :destroy, :compile, :download]

  def index
    @user = current_user
    @projects = @user.projects
  end

  def show
    set_project_id @project # This feels like the wrong way.
    @project_items = @project.project_items
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

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project updated.'
    else
      render :show # I am not sure of the use of a separate edit.
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project deleted.'
  end

  def compile
    @project_items = @project.project_items
    if @project.generate_pdf
      redirect_to @project, notice: "Project compiled successfully."
    else
      redirect_to @project, alert: "Error compiling project."
    end
  end

  def download
    @pdf = Rails.root.join("projects/#{@project[:id]}.pdf")
    send_file @pdf, disposition: "attachment"
  end

  private

    def project_params
      params.require(:project).permit(:user_id, :name, :id)
    end

    def set_project
      @project = Project.find(params[:id])
    end

    def set_project_id project
      session[:project_id] = project.id
    end

end
