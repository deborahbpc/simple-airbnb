Rails.application.routes.draw do
  # get 'flats/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :flats

  root to: 'flats#index'
end
