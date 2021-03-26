Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root "home#index"
  resources :jobs do
    patch 'status', on: :member
    get '/all_applications', to: 'jobs#all_applications'
  end
  resources :job_applications do
    patch 'decide', to: 'job_applications#decide'
  end
  get 'search_job', to:"jobs#search"
  get 'search_company', to:"companies#search"
  resources :job_applications 
  resources :companies, only: %i[index new create show edit update]
end
