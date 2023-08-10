Rails.application.routes.draw do
  root to: 'recipes#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "users#index"
  resources :foods, only: [:new, :create, :index, :destroy]
  resources :recipes do
    resources :recipe_foods
  end
end
