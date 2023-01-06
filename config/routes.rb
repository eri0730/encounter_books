Rails.application.routes.draw do
  devise_for :users
  root to: "books#index"
  resources :books
  # resources :books do
    # resources :favorites, only: [:create, :destroy]
  # end  
  resources :users, only: :show
  post   "favorites/:book_id/create"  => "favorites#create"
  delete "favorites/:book_id/destroy" => "favorites#destroy"


end