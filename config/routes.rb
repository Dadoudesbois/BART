Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :profiles do
    resources :events, only: [:new, :create]
    member do
      get 'dashboard'
      resources :chatboxes, only: [:create]
    end
  end

  resources :chatboxes, only: [:index, :show] do
    resources :messages, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :bars do
    resources :pictures, only: [:new, :create, :destroy]
  end

  resources :events, only: [:show, :index, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
