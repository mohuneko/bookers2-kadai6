Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about'

  resources :books
  resources :users,only: [:show,:index,:edit,:update]
  resources :books, only: [:new, :create, :index, :show] do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
  end
  resources :books, shallow: true do
  	resources :book_comments, only: %i[create edit update destroy]
  end
end
