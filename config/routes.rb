Rails.application.routes.draw do

  devise_for :users

  resources :articles, only: [:index, :create, :new, :show]

  post 'search',      to: 'search#search'
  get 'autocomplete', to: 'search#autocomplete'

  root to: 'articles#index'
end
