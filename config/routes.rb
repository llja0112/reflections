Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  mount Commontator::Engine => '/commontator'

  devise_for :users

  resources :users, only: [:index, :show, :update]
  resources :reflections, only: [:index, :show, :edit, :update]
  resources :reviews, only: [:show, :edit, :update]

  root 'home#index'
  get 'demo', to: 'home#demo'
  get 'about', to: 'home#about'
  get 'users/typeahead/:query', to: 'users#typeahead'
  get 'add_reflection', to: 'reflections#add', as: 'add_reflection'
  get 'reflections/:id/privacy', to: 'reflections#privacy', as: 'reflection_privacy'
  get 'reflections/:id/review', to: 'reflections#review', as: 'reflection_review'

  post 'reflections/new', to: 'reflections#new', as: 'new_reflection'
  post 'reflections/:id/authorise', to: 'reflections#authorise', as: 'authorise_personals'
  post 'reflections/:id/update_privacy', to: 'reflections#update_privacy', as: 'update_reflection_privacy'
  post 'reflections/:id/', to: 'reflections#submit_for_review', as: 'submit_for_review'
end
