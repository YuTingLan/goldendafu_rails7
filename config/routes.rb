# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'

  resources :products do
    resources :comments, shallow: true, only: %i[create update edit destroy]
  end
end
