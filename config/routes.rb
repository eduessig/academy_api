Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "auth"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :users
  resources :exercises
  resources :workouts
  resources :personal_trainers
  resources :physical_reviews

  match "workout_exercises/link_workout_to_exercise", to: "workout_exercises#link_workout_to_exercise", via: :post
  post "/login", to: "auth#login"
end
