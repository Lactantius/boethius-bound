class BooksSelectionsController < ApplicationController

  def show
    @project_items = current_project.project_items
  end

end
