Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :about, only: [:index]
  resources :our_services, only: [:index]
  resources :rates, only: [:index]
  resources :careers, only: [:index]
  resources :media, only: [:index]
  resources :faqs, only: [:index]
  resources :contact_us, only: [:index]

  resources :restaurants do
    resources :reports, only: [:create, :new, :edit, :update, :destroy]
  end

  resources :reports, only: [:show, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :reports, only: [:show]
    end
  end

end
