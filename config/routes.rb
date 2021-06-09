Rails.application.routes.draw do
  resources :reviews 
  resources :votes
  # resources :categories
  resources :categories, only: %i[index show new create edit update]

  # resources :votes
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "reviews#index"
end
