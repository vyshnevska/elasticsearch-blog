Dashboard::Engine.routes.draw do

  resources :analytic_reports
  root to: 'report#index'
end
