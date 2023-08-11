Rails.application.routes.draw do
  root to: 'recipes#index'

  devise_for :users

  resources :recipes do
    resources :foods, only: [:new, :create]
    resources :recipe_foods, only: [:new, :create, :index, :destroy]
    member do
      patch 'toggle_public'
    end
  end

  resources :shopping_lists

  resources :foods, only: [:new, :create, :index, :destroy]
end
