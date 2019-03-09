Rails.application.routes.draw do

  resources :events

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'events#index'


end
