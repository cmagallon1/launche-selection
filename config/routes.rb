Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :meals,:launch_packages
  
  root 'meals#index'
end
