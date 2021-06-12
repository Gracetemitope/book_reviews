Rails.application.routes.draw do
  # root to: "reviews#index"
  root 'categories#index'

  devise_for :users
  resources :reviews do
      resources :votes
    end
  # end
  # resources :votes
  resources :categories, only: %i[index show new create edit update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
