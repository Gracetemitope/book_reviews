Rails.application.routes.draw do
  resources :reviews do 
    resources :votes, only: [:create, :destroy]


  end
  resources :categories
  # resources :votes
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "reviews#index"
end
