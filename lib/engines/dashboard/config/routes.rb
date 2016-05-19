Dashboard::Engine.routes.draw do

  resources :analytic_reports, only: [:show]
  root to: 'application#index'
end
