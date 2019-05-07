Rails.application.routes.draw do

  get 'homesa/index'
  get 'homea/index'
  resources :superadmins
  resources :admins
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'sessions/new'
  get 'login/index'
  resources :users
  get 'home/index'

  resources :posts

  root 'home#index'

  get 'home2/index'
  root 'home2#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
