Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'recipes#index'
  resources :recipes do
    resources :favorites, only: [:create]
    resources :meals, only: [:create]
    resources :reviews, only: [:new, :create, :destroy]
  end

  resources :favorites, only: [:index]
  resources :meals, only: [:index, :destroy]
  delete "meals", to: "meals#destroy"

  patch 'calendars/:id/share', to: 'calendars#share', as: 'share'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
