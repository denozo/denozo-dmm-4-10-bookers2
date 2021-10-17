Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  
  get 'homes/about', to: 'homes#about'
  
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
  
end