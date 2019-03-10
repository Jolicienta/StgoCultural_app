Rails.application.routes.draw do

  get 'users/index'
  resources :events

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'events#index'


end
