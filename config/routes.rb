Rails.application.routes.draw do
  root 'categories#index'

  devise_for :users

  get 'vote/:id', to: 'votes#vote'

  
  resources :categories, only: %i[index show new create edit update]
  resources :reviews do
    resources :comments

  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
