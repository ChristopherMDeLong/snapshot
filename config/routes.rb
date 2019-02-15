Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :restaurants do
    resources :reports, only: [:create, :new]
  end
  resources :reports, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :reports, only: [:show]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :restaurants, only: [:show] do
        get "/matches", to: "restaurants#matches"
      end
    end
  end

end
