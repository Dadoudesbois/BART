Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # resources :chatboxes, only: [ :index, :show ] do
  #   resources :messages, only: [:new, :create]
  # end
  resources :chatboxes, only: [:show]

  resources :profiles do
    resources :artist_pictures, only: [:new, :create]
    # resources :chatboxes, only: [:new, :create]
    member do
      get 'dashboard'
    end
    resources :events, only: [:new, :create]
  end

  # resources :messages, only: [:edit, :update, :destroy]

  resources :bars do
    resources :pictures, only: [:new, :create]
  end
  resources :pictures, only: [:destroy]
  resources :artist_pictures, only: [:destroy]

  resources :events, only: [:show, :index, :edit, :update, :destroy] do
    member do
      get 'preview'
      get 'confirm'
    end
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
