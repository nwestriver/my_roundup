Rails.application.routes.draw do
root "top#index"

resources :websites
end
