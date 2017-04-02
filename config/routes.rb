Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :messages, except: [:edit, :update, :destroy]
  get 'signin', to: 'sessions#create', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
