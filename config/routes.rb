Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  
  get "homes/about" => "homes#about", as: "about"
  
  resources :users, only: [:index, :show, :edit, :update,:create]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  
end