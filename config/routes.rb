RadiheyRails::Application.routes.draw do
  root to: 'top#show'

  match '/activate/:pre_register_token', to: 'users#activate', :as => :activate
  match 'activated', to: 'users#activated', :as => :activated

  resources :users do
    get :pre_registered
  end
end
