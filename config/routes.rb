Rails.application.routes.draw do

#  get '/login', to: 'user_sessions#new'
#  post '/login', to: 'user_sessions#create'
#  root 'user_sessions#new'
#  get '/signup', to: 'users#new'  
#  post '/signup', to: 'users#create'


  root 'static_pages#index'
  get '/about',                   to: 'static_pages#about'
  get '/auth/:provider/callback', to: 'user_sessions#auth_create'
  get '/login',                   to: 'user_sessions#auth_new'
  delete '/logout',               to: 'user_sessions#destroy'
  get '/help',                    to: 'static_pages#help'
  get '/article/create',          to: 'articles#new'
  post '/article/create',         to: 'articles#create', as: :create_article
  
  resources :users
  resources :articles do
      member do
          patch 'push'
          patch 'publish'
      end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
