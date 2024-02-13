Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # First, add a new route to list the tasks, following the conventionfrom the lecture.
  get "/tasks", to:"tasks#index", as: :tasks

  get "/tasks/new", to:"tasks#new", as: :new_task

  # finds a specific task
  get "/tasks/:id", to:"tasks#show", as: :task
  # new route, a new controller action and a new view.

  # Two routes (to handle creation of a task)
  # 1. Display the task form
  # 2. Handles the post request
  post "/tasks", to:"tasks#create"


  # Editing tasks
  get "/tasks/:id/edit", to:"tasks#edit", as: :edit_task
  # patch "/tasks/:id", to:
  patch "tasks/id", to:"tasks#update"


end
