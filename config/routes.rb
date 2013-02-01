RadiheyRails::Application.routes.draw do
  root to: 'top#show'

  match '/activate/:pre_register_token', to: 'users#activate', :as => :activate
  match 'activated', to: 'users#activated', :as => :activated
  match 'join', to: 'users#new', :as => :join
  match 'login', to: 'user_sessions#new', :as => :login
  match 'logout', to: 'user_sessions#destroy', :as => :logout
  match 'account_settings', to: 'users#edit', :as => :account_settings

  resources :user_sessions

  resources :users do
    get :pre_registered
  end

  scope ":username" do
    resources :channels
  end

  match '/:username', to: 'channels#index', :as => :home

  # 404ページ # develop環境で表示テストをするには、このunlessを外してください。
  # ApplicationController内のunlessも外してください。
  unless Rails.application.config.consider_all_requests_local
    match '*not_found', to: 'errors#error_404'
  end
end
