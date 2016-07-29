Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount ActionCable.server => '/cable'
  
  get 'welcome', to: 'pages#welcome'
  get 'help', to: 'pages#help'
  get 'contact', to: 'pages#contact'
  
  root 'pages#welcome'
  
  #Users
  devise_for :users
  resources :users
  
  #Projects
  resources :projects do
    resources :chats , :only => [:show] do
      resources :messages, :only => [:show]
      resources :topics
    end
  end 
    
  get 'users/profile/:id', to: 'users#profile'
  
end
