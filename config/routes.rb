RadiheyRails::Application.routes.draw do
  root to: 'top#show'

  match '/activate/:pre_register_token', to: 'users#activate', :as => :activate
  match 'activated', to: 'users#activated', :as => :activated
  match 'join', to: 'users#new', :as => :join
  match 'login', to: 'user_sessions#new', :as => :login
  match 'logout', to: 'user_sessions#destroy', :as => :logout

  resources :user_sessions

  resources :users do
    get :pre_registered
  end

  scope ":username" do
    resources :channels
  end

  match '/:username', to: 'channels#index', :as => :home
end
