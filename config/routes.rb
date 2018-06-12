Rails.application.routes.draw do
  get 'dashboard/courses_index'
  get 'dashboard/bookings_index'
  devise_for :users
  root to: 'pages#home'

  resources :courses do
    resources :bookings, only: [:new, :create]
  end

  get "/mycourses", to: "dashboard#courses_index"
  get "/mybookings", to: "dashboard#bookings_index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
