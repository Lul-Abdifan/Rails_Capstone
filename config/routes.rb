Rails.application.routes.draw do
  resources :recipes do
    resources :foods, only: [:new, :create]
    member do
      patch 'toggle_public'
    end
  end
  
  devise_for :users

  resources :foods, only: [:new, :create, :index, :destroy]
end
