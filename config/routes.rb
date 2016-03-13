Rails.application.routes.draw do

  devise_for :users

  resources :articles

  post 'search', to: 'search#search'

  root to: 'articles#index', as: '/'
end
