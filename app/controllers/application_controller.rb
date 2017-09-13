require 'boethius'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_project

  def current_project
    if session[:project_id]
      Project.find(session[:project_id])
    else
      redirect_to projects_url
    end
  end

end
