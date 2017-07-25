class ProjectsController < ApplicationController

  def new
  end

  def show
    @project_items = current_project.project_items
  end

end
