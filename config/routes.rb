Rails.application.routes.draw do
  devise_for :users

  scope '(:locale)', locale: /(en|fr)/ do
    root 'home#index'
    resources :users, only: :show

    resources :events do
      resources :registrations, controller: 'events_users'
      resources :teams do
        resources :registrations, controller: 'teams_users'
      end
    end
  end

  get 'locale/switch/:locale', to: 'locale#switch', as: 'locale_switch'
end
