Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :project_items
  resources :projects
  resource :books_selection, only: [:show]
  post 'compile_project' => 'projects#compile'
  # It seems like there ought to be a different way.
  get 'projects/:id/download', to: 'projects#download', as: :download
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
  get 'home' => 'static_pages#home'
  get 'about' => 'static_pages#about'
end
