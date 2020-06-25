Rails.application.routes.draw do

  root :to => 'pages#home'
  resources :users
  get '/favorites' => 'favorites#add'
  delete '/favorites' => 'favorites#remove'

  get '/comments' => 'comments#add'
  delete '/comments' => 'comments#remove'

  resources :movies, only: [:index, :show]
  resources :my_list, only: [:index]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
