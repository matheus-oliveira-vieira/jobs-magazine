Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root "home#index"
  resources :jobs do
    patch 'status', on: :member
  end
  resources :companies, only: %i[index new create show edit update]
end
