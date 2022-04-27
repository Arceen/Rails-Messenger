Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "chatroom#index"
  get "login", to: 'session#new'
  post "login", to: 'session#create'
  delete "logout", to: 'session#destroy'
  post "message", to: 'messages#create'

  # mount ActionCable.server, at: '/cable'
end
