Rails.application.routes.draw do
  resources :categories
  resources :votes
  resources :reviews
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "reviews#index"
end
