Rails.application.routes.draw do
   
  get :singup, to: "users#new"
  get :login, to: "sessions#new"
  delete :logout, to: "sessions#destroy"

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, expend: :index do
      resources :answers, shallow: true, expend: :index
    end
   
    member do
      post :start
    end
  end 
 
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  root 'tests#index'

end
