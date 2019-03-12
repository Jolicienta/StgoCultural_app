Rails.application.routes.draw do

  # get 'users/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :events do
    resources :comments
    resources :favorites, only: :create
  end

  resources :favorites, only: [:destroy] do
    patch 'remove_favorite_event'
  end

  get 'profile', to: 'users#profile', as: 'profile'

  root 'events#index'
end
