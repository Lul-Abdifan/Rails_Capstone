Rails.application.routes.draw do
  root to: 'recipes#index'

  devise_for :users

  get 'public_recipes', to: 'public_recipes#index', as: :public_recipes

  resources :recipes do
    resources :foods, only: [:new, :create]
    resources :recipe_foods, only: [:new, :create, :index, :destroy]
    member do
      patch 'toggle_public'
    end
  end

  resources :shopping_lists, only: [:index]

  resources :foods, only: [:new, :create, :index, :destroy]
end
