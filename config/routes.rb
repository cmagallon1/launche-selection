Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :meals,:lunch_packages, :sessions

  if Rails.env.development?
    get '/coverage', to: 'coverages#index'
  end

  root 'sessions#new'
end
