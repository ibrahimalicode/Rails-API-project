Rails.application.routes.draw do
  namespace :api do
    resources :users
    resources :courses do
      resources :lessons
      resources :assignments
      resources :enrollments, only: [:index, :show, :create] # optional nested enrollments
    end
    resources :lessons, only: [:index, :show]
    resources :assignments, only: [:index, :show]
    resources :enrollments
  end
end

