Rails.application.routes.draw do
  get 'achievements/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'achievements/:id', to: 'achievements#show', as: 'achievement'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :profiles, only: %i[show update destroy]

  # for AJAX update of study minutes
  get '/update_study_time', to: 'pages#update_study_time'
end
