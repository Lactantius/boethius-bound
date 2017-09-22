class ProjectItemsController < ApplicationController

  before_action :set_project_item, only: [:update, :destroy]

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
    if @project_item.update(project_item_params)
      redirect_to @project, notice: 'Book updated.'
    else
      redirect_to @project, notice: 'Book failed to update.'
    end
  end

  def destroy
    @project_item.destroy
    redirect_to books_selection_path, notice: 'Book deleted.'
  end

  private

    def project_item_params
      params.require(:project_item).permit(:project_id, :book_id, :font,
                      selections_attributes: [:sections])
    end

    def set_project_item
      @project = current_project
      @project_item = @project.project_items.find(params[:id])
    end

end
