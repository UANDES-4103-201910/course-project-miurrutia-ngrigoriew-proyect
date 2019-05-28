Rails.application.routes.draw do

  get 'users/index'
  get 'users/create'
  get 'users/update'
  get 'users/show'

  get 'users/destroy'
  devise_for :users
  get 'atotal/index'
  get 'utotal/index'
  get 'homesa/index'
  get 'homea/index'
  resources :superadmins
  resources :admins

  get    '/login',   to: 'users#sign_in'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'sessions/new'
  get 'login/index'
  get 'home/index'
  get 'users/index'

  resources :posts do
    resources :comments
  end

  resources :users do
    resources :comments
  end

  root 'home#index'

  get 'home2/index'
  root 'home2#index'

  resources :dumpster
  get 'dumpster/index'
  resources :blacklist
  get 'blacklist/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
