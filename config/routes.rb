Rails.application.routes.draw do

  devise_for :users
  root to: 'recipes#index'
  resources :recipes do
    resources :favorites, only: [:create]
    resources :meals, only: [:create]
  end

  resources :favorites, only: [:index]
  resources :meals, only: [:index]
  delete 'meals', to: 'meals#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
