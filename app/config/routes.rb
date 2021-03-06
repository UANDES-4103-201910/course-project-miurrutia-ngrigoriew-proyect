Rails.application.routes.draw do

  get 'alpost/index'
  get 'users/index'
  get 'users/create'
  get 'users/new'
  post '/create_user' => 'users#create'
  get 'users/update'


  get 'users/destroy'
 devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  get 'atotal/index'
  get 'atotal/show'
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

  resources :posts do
    member do
      put "like" => "posts#upvote"
      put "unlike" => "posts#downvote"
    end
  end

  resources  :posts do
  member do
    resources :comments
  end
end
  root 'home#index'

  get 'home2/index'
  root 'home2#index'

  resources :dumpster
  get 'dumpster/index'
  resources :blacklist
  get 'blacklist/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/search' => 'pages#search', :as => 'search_page'
  get '/search1' => 'pages#search1', :as => 'search1_page'
  get '/search2' => 'pages#search2', :as => 'search2_page'
end
