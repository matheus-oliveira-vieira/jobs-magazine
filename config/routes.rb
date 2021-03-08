Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root "home#index"
  resources :jobs do
    patch 'status', on: :member
  end
  get 'search_job', to:"jobs#search"
  get 'search_company', to:"companies#search"
  
  resources :companies, only: %i[index new create show edit update]
end
