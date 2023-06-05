Rails.application.routes.draw do
  resources :bookings
  devise_for :users
  root to: "pages#home"
  get 'pages/dashboard', to: 'pages#dashboard'
  resources :cruises do
    resources :bookings, only: :create
  end
end
