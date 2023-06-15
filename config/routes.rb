Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'achievements/:id', to: 'achievements#show', as: 'achievement'
  resources :profiles, only: %i[index show update destroy]
  resources :achievements, only: [:index]
end
