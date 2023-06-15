Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Defines the root path route ("/")
  # root "articles#index"

  # for AJAX update of study minutes
  get '/update_study_time', to: 'pages#update_study_time'
  resources :profiles, only: %i[index show update destroy]
  resources :achievements, only: [:index]
end
