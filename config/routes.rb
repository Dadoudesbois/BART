Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :chatboxes, only: [ :index, :show ] do
    resources :messages, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :profiles do
    resources :chatboxes, only: [:create]
    member do
      get 'dashboard'
    end
    resources :events, only: [:new, :create]
  end


  resources :bars do
    resources :pictures, only: [:new, :create]
  end
  resources :pictures, only: [:destroy]

  resources :events, only: [:show, :index, :edit, :update, :destroy] do
    member do
      get 'preview'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
