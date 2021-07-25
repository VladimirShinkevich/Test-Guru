# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sing_in: :login, sing_out: :logout }, controllers: { sessions: "users/sessions" }

  resources :tests, only: :index do
    member do
      get :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :badges
    resources :gists
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, expend: :index do
        resources :answers, shallow: true, expend: :index
      end
    end
  end

  resources :gists, only: :create

  resources :feed_back

  resources :badges, only: %i[index]
  get 'achievements', to: 'badges#achievements'

end
