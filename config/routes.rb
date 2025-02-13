Rails.application.routes.draw do
  resources :results do 
    get 'yesterday', on: :collection
    get 'weekly', on: :collection
  end

  resources :raffles
  resources :places
  resources :schedules
  resources :places
  resources :draws

  get "up" => "rails/health#show", as: :rails_health_check
end
