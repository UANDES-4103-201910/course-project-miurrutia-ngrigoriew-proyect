Rails.application.routes.draw do
  resources :users
  get 'home/index'

  resources :posts

  root 'home#index'

  get 'home2/index'
  root 'home2#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
