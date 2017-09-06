Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :users

  resources :users, only: [:index, :show, :update]
  resources :reflections, only: [:show, :edit, :update]

  root 'home#index'
  get 'demo', to: 'home#demo'
  get 'about', to: 'home#about'
  get 'add_reflection', to: 'reflections#add', as: 'add_reflection'

  post 'reflections/new', to: 'reflections#new', as: 'new_reflection'
  post 'reflections/:id/update_privacy', to: 'reflections#update_privacy', as: 'update_reflection_privacy'
end
