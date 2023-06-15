Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :profiles, only: %i[index update destroy]
  resources :achievements, only: [:index]
end
