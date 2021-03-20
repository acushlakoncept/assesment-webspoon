Rails.application.routes.draw do
  resources :users
  root "users#index"
  get 'jsonusers', to: 'users#json_users', :defaults => { :format => 'json' }
end
