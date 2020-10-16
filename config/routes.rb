Rails.application.routes.draw do
  # get 'about/index'
  # get 'home/index'
  # get 'authors/index'
  # get 'authors/show'
  # get 'books/index'
  # get 'books/show'

  root to: "home#index"
  resources :books, only: %i[index show]
  resources :authors, only: %i[index show]
  resources :about, only: %i[index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
