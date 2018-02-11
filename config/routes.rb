Rails.application.routes.draw do
  resources :companies
  root 'root#index'
end
