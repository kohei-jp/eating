Rails.application.routes.draw do
  get 'shops/index'
  get 'shops/search'
  get 'sessions/new'
  # get 'users/new' ,to:"users#new" ,as: "new_user"
  # post 'users/create' 
  get 'homes/help'
  # このURLだと、homeコントローラのindexアクションである事は明確だから、to:〜は記載不要
  root 'homes#index'
  
  resources :users
  resources :shops
  get 'shops/show'
  resources :search
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
