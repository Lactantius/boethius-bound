Rails.application.routes.draw do
  resources :books
  resources :project_items
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
  get 'home' => 'static_pages#home'
  get 'about' => 'static_pages#about'
end
