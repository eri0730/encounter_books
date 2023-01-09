Rails.application.routes.draw do
  devise_for :users
  root to: "books#index"
  resources :books
  resources :users, only: :show

  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'


end