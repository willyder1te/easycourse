Rails.application.routes.draw do
  get 'dashboard/courses_index'
  get 'dashboard/bookings_index'
  devise_for :users
  root to: 'pages#home'


  resources :courses do
    resources :bookings, only: [:new, :create, :show, :index]
  end

  get "/mycourses", to: "dashboard#courses_index", as: "my_courses"
  get "/mybookings", to: "dashboard#bookings_index", as: "my_bookings"
  get "/user/:id", to: "users#show", as: "show_profile"
  get "/updateprofile", to: "users#edit", as: "edit_profile"
  patch "/updateprofile", to: "users#update", as: "update_profile"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
