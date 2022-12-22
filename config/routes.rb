Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :tweets, only: [:new, :delete, :create ,:show]
    resources :likes, only: [:new, :delete, :create]
  end

  resources :tweets, only: [:index]

  root 'tweets#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
