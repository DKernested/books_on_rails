Rails.application.routes.draw do
  # get 'home/index'
  # get 'authors/index'
  # get 'authors/show'
  # get 'books/index'
  # get 'books/show'

  root to: "home#index"
  resources :books, only: %i[index show]
  resources :authors, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
