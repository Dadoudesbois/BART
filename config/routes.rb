Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :profiles do
    member do
      get 'dashboard'
    end
  end
  resources :bars do
    resources :events, only: [:new, :create, :edit, :update, :delete]
  end
  resources :messages, except: [:show]
  resources :events, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
