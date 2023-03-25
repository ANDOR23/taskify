Rails.application.routes.draw do
  resources :tasks
  root "tasks#index"
  post "tasks/:id/toggle", to: "tasks#toggle"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   
end
