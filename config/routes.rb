Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  ressources :profiles do
    member do
      get 'dashboard'
    end
  end
  ressources :bars do
    ressources :events, only: [:new, :create, :edit, :update, :delete]
  end
  ressources :messages, except: [:show]
  ressources :events, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
