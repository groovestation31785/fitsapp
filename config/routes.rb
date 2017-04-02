Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :messages, except: [:edit, :update, :destroy]
  resources :clients, only: [:new, :create]

  get    '/signup',  to: 'clients#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/logout', to: 'sessions#destroy'
end
