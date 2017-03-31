Rails.application.routes.draw do
  resources :site_users
  resources :sites
  root 'application#home'
  resources :profiles
  resources :users
  get 'chart/index'
  get 'chart/data', :defaults => { :format => 'json' }
  get 'reports', to: 'reports#index'
  get 'reports/accounts'
  get 'reports/ethnicity'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
