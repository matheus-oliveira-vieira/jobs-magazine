Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root "home#index"
  resources :jobs do
    patch 'status', on: :member
    get '/all_applications', to: 'jobs#all_applications'
  end
  resources :job_applications do
    resources :propositions do
      patch 'accept', to: 'propositions#accept'
      patch 'reject', to: 'propositions#reject'
    end
  end
  get 'search_job', to:"jobs#search"
  get 'search_company', to:"companies#search"
  resources :job_applications 
  resources :companies, only: %i[index new create show edit update]
end
