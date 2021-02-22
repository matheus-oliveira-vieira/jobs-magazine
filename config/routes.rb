Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :jobs
  resources :companies, only: %i[index new create show edit update]
end
