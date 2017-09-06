Rails.application.routes.draw do
  root 'home#index'
  get 'demo', to: 'home#demo'
  get 'about', to: 'home#about'
end
