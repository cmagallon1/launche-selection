Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :meals, :sessions
  resources :users do 
    resource :lunch_packages
  end

  if Rails.env.development?
    get '/coverage', to: 'coverages#index'
  end

  root 'sessions#new'
end
