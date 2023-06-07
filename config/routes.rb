Rails.application.routes.draw do
  resources :bookings
  devise_for :users
  root to: "pages#home"
  get 'pages/dashboard', to: 'pages#dashboard'
  get 'pages/my_profil', to: 'pages#my_profil'
  get 'pages/accept_booking', to: 'pages#accept_booking'
  get 'pages/refuse_booking', to: 'pages#refuse_booking'
  resources :cruises do
    resources :bookings, only: :create
  end
end
