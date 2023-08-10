Rails.application.routes.draw do
  resources :recipes do
    resources :foods, only: [:new, :create]
  end
  
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "users#index"
  
  resources :foods, only: [:new, :create, :index, :destroy]
end
