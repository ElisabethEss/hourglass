Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :profiles, only: %i[index destroy]
  # delete 'profiles', to: 'profiles#destroy', as: :delete_profile
  resources :achievements, only: [:index]
end
