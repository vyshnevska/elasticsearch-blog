Rails.application.routes.draw do

  devise_for :users

  resources :articles, only: [:index, :create, :new, :show] do
    collection do
      get :nodes_graph_data
      get :dots_chart
      get :dots_chart_data
    end
  end

  post 'search',      to: 'search#search'
  get 'autocomplete', to: 'search#autocomplete'

  root to: 'articles#index'

  mount Dashboard::Engine, at: "/dashboard", :as => "dashboard_engine"
end
