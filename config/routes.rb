Rails.application.routes.draw do

  root :to => 'pages#home'
  resources :users
  resources :movies, only: [:index, :show]
  resources :my_list, only: [:index]
  resources :comments_admin, only: [:index]
  resources :comments, only: [:create]
  
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  get '/favorites' => 'favorites#add'
  delete '/favorites' => 'favorites#remove'
  delete '/comments_admin' => 'comments_admin#remove'

end
