Rails.application.routes.draw do
  
  get 'topic_results/new'

  get 'topic_results/show'

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
    patch :complete
    get :data
    resources :chats , :only => [:show] do
      member do
        patch :nexttopic
      end
      resources :messages, :only => [:show]
      resources :topics
      resources :topic_results, :path => "results"
    end
  end 
end
