Rails.application.routes.draw do

  root :to => 'pages#home'
  resources :users
  get '/favorites' => 'favorites#add'
  delete '/favorites' => 'favorites#remove'
  resources :movies, only: [:index, :show]
  
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  
  
end
