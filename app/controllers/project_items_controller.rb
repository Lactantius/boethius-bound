class ProjectItemsController < ApplicationController

  def create
    @project = current_project
    @project_item = @project.project_items.build(project_item_params)
    if @project_item.save
      redirect_to @project, notice: 'Book added successfully.'
    else
      redirect_to @project, notice: 'Book was not added successfully.'
    end
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
