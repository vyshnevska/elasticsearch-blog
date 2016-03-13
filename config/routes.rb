Rails.application.routes.draw do

  devise_for :users

  resources :articles do
    collection { get :search }
  end
  get 'search', to: 'search#search'
  root to: 'articles#index', as: '/'
end
