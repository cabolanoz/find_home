Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'properties#index'

  # Resources for properties
  resources :properties

  # Resources for features
  resources :features

  # Resources for photos
  # resources :photos
end
