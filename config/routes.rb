Rails.application.routes.draw do
root "top#index"
resources :users do
    resources :websites
end

get "/login", to: "logins#new"
post "/login", to: "logins#create"
resource :logout, only: %i[destroy]
end
