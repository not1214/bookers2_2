Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => "homes#about"

  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end


end
