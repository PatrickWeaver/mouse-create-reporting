Rails.application.routes.draw do
  resources :group_users
  resources :groups
  resources :evidence_types
  resources :evidence_assets
  resources :evidence_users
  resources :evidences
  resources :role_users
  resources :roles
  resources :site_users
  resources :sites
  root 'application#home'
  resources :profiles
  resources :users
  get 'chart/index'
  get 'chart/data', :defaults => { :format => 'json' }
  get 'reports/accounts', to: 'reports#accounts'
  get 'reports/projects', to: 'reports#projects'
  get 'reports/ethnicity'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
