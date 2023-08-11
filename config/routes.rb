Rails.application.routes.draw do

  root to: 'recipes#index'


  devise_for :users


  # Defines the root path route ("/")
  # root "articles#index"
  # root "users#index"
  resources :shopping_lists

  resources :foods, only: [:new, :create, :index, :destroy]
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :index, :destroy]
  end
end
