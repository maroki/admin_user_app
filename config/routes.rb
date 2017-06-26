Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'welcome#index'

  namespace :admin do
    resources :users do
      member do
        get :mail_info
      end
    end
  end

  resources :welcome, only: [:index]
end
