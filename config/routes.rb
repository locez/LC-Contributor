Rails.application.routes.draw do

  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'
  root 'user_sessions#new'
  get '/help', to: 'static_pages#help'

  get '/signup', to: 'users#new'  
  post '/signup', to: 'users#create'

  get '/article/create', to: 'articles#new'
  post '/article/create', to: 'articles#create', as: :create_article
  
  get '/users/check', to: 'users#check', as: :check_articles
#  get '/article-edit', to: 'articles#edit'
  resources :users
#  resources :user_sessions
  resources :articles do
      member do
          patch 'push'
      end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
