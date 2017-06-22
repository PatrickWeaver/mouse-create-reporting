Rails.application.routes.draw do
  resources :badge_users
  resources :badge_projects
  resources :badges
  resources :curriculum_projects
  resources :curriculas
  resources :network_site
  resources :networks
  resources :group_projects
  resources :projects
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
  get 'reports/demographics', to: 'reports#demographics'
  get 'reports/projects', to: 'reports#projects'
  get 'reports/badges', to: 'reports#badges'
  get 'reports/ethnicity'
  get 'reports/test'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
