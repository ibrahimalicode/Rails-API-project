Rails.application.routes.draw do
  namespace :api do
    resources :users
    resources :courses do
      resources :lessons
      resources :assignments
    end
    resources :enrollments
  end
end
