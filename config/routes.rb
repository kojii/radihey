# -*- coding: utf-8 -*-
RadiheyRails::Application.routes.draw do
  root to: 'top#show'

  match '/activate/:pre_register_token', to: 'users#activate', :as => :activate
  match 'activated', to: 'users#activated', :as => :activated
  match 'join', to: 'users#new', :as => :join
  match 'login', to: 'user_sessions#new', :as => :login
  match 'logout', to: 'user_sessions#destroy', :as => :logout

  #match 'account_settings', to: 'users#edit', :as => :account_settings

  resources :user_sessions

  resources :users do
    get :pre_registered
  end

  scope 'settings' do
    resources :button_images
    resources :default_button_sets do
      get :add_button, :on => :collection
      post :upload, :on => :collection
    end

    match 'account', to: 'users#edit', :as => :account_settings
    resources :buttons
    resources :button_ses do
      get 'list_all', :as => :list_all, :on => :collection
    end
    resources :channels do
      get "buttons/:set_id", action: "buttons", :on => :member, :as => :buttons
      get "selected_buttons/:set_id", action: "selected_buttons", :on => :member, :as => :selected_buttons
      get 'get_buttons/:persona_id', to: 'channels#get_buttons_by_persona', :as => :get_buttons_by_persona
    end
  end

  scope ":username" do
    scope ':channel_id' do
      match 'get_buttons/:persona_id', to: 'channels#get_selected_buttons_by_persona', :as => :get_selected_buttons_by_persona
      match '', to: 'channels#broadcast', :as => :broadcast_channel
    end
  end

  match '/:username', to: 'channels#index', :as => :home

  # 404ページ # develop環境で表示テストをするには、このunlessを外してください。
  # ApplicationController内のunlessも外してください。
  unless Rails.application.config.consider_all_requests_local
    match '*not_found', to: 'errors#error_404'
  end
end
