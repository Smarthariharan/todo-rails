Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check
   get '/todos' , to: 'todos#index'
   get '/todo/:id', to: 'todos#show'

   post '/todos', to: 'todos#create'

   put '/todos/:id', to: 'todos#update'

   delete '/todos/:id', to: 'todos#delete'

  # Defines the root path route ("/")
  # root "posts#index"
end
