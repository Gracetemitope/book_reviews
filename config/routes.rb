Rails.application.routes.draw do
  root 'categories#index'

  devise_for :users
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end

  resources :reviews 
  # resources :votes
  get 'vote/:id', to: 'votes#vote'

  # end
  # resources :votes
  resources :categories, only: %i[index show new create edit update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
