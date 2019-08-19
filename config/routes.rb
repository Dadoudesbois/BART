Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :profiles do
    ressources :events, only: [:new, :create]
    member do
      get 'dashboard'
    end
  end
  resources :bars
  resources :messages, except: [:show]
  resources :events, only: [:show, :index, :edit, :update, :delete]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
