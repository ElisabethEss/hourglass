Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :profiles, only: %i[index destroy]
  resources :achievements, only: [:index]
  resources :avatars, only: %i[index]
  resources :user_avatars, only: [:create]
  get '/update_study_time', to: 'pages#update_study_time'
  get '/update_break_time', to: 'pages#update_break_time'
end
