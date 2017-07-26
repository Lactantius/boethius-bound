class ProjectItemsController < ApplicationController

  def create
    @project = current_project
    @project_item = @project.project_items.new(project_item_params)
    @project.save
    session[:project_id] = @project.id
  end

  def update
    @project = current_project
    @project_item = @project.project_items.find(params[:id])
    @project_item.update_attributes(project_item_params)
    @project_items = @project.project_items
  end

  def destroy
    @project = current_project
    @project_item = @project.project_items.find(params[:id])
    @project_item.destroy
    @project_items = @project.project_items
  end
 
  private

    def project_item_params
      params.require(:project_item).permit(:project_id, :book_id, :font)
    end

end
