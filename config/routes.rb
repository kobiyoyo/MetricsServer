Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :sites do 
        resources :categories, only: [:index]
        resources :metrics, only: [:index]
        get 'averages', to: 'averages#index' 
      end
      resources :categories, only: [:destroy, :update, :create]
      resources :metrics, only: [:destroy, :update, :create]
    end
  end
end
