Rails.application.routes.draw do
  resources :bookings
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: "pages#home"
  get 'pages/dashboard', to: 'pages#dashboard'
  get 'pages/my_profil', to: 'pages#my_profil'
  get 'pages/user_profil', to: 'pages#user_profil'
  get 'pages/accept_booking', to: 'pages#accept_booking'
  get 'pages/refuse_booking', to: 'pages#refuse_booking'
  get 'pages/results', to: 'pages#results'
  post 'pages/add_profile_picture', to: 'pages#add_profile_picture'
  resources :cruises do
    resources :bookings, only: :create
  end
  resources :user do
    resources :reviews, only: :create
  end
end
