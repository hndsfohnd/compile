Rails.application.routes.draw do
  root 'users#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :users, only: [:show]
  resources :estimates do
    resources :decisions, only: [:new,:create]
  end
  resources :bookings do
    resources :decisions, only: [:new,:create] 
    resources :expenses, only: [:new,:create]
    member do
        get :issue
        post :issue, to: "bookings#issue"
    end
  end
  resources :decisions,only:[:index,:show] 
  resources :expenses,only: [:index,:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
