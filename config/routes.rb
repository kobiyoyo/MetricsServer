Rails.application.routes.draw do
  resources :metrics
  resources :sites
  namespace :api do
    namespace :v1 do
      resources :categories
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
