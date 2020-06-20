Rails.application.routes.draw do
  
  get 'favorites/new'
  root :to => 'pages#home'
  resources :users

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :favorites
  
end
