Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'users/update'

  devise_for :users

  resources :users, only: [:index, :show, :update]
  
  root 'home#index'
  get 'demo', to: 'home#demo'
  get 'about', to: 'home#about'
end
