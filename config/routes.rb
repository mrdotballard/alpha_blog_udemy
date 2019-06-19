Rails.application.routes.draw do

  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles #gives all needed paths 

  get 'signup', to: 'users#new'
  # post 'users', to: 'users#create'
  resources :users, except: [:new]
end
