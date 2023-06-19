Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :profiles, only: %i[index destroy]
  resources :achievements, only: [:index]
  resources :avatars, only: [:index]
  get '/update_study_time', to: 'pages#update_study_time'
end
