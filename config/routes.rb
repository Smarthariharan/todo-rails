Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  get "up" => "rails/health#show", as: :rails_health_check
   get '/todos' , to: 'todos#index'
   get '/todo/:id', to: 'todos#show'

   post '/todos', to: 'todos#create'

   put '/todos/:id', to: 'todos#update'

   delete '/todos/:id', to: 'todos#delete'

   delete '/delete_all_todos' , to:'todos#delete_all_todos'

  # Defines the root path route ("/")
  # root "posts#index"
end
