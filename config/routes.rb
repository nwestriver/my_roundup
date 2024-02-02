Rails.application.routes.draw do
root "top#index"

resources :websites
resources :users
get "/login", to: "logins#new"
post "/login", to: "logins#create"
resource :logout, only: %i[destroy]
end
