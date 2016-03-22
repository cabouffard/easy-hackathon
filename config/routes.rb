Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  scope '(:locale)', locale: /(en|fr)/ do
    resources :events do
      resources :registrations
    end
  end

  get 'locale/switch/:locale', to: 'locale#switch', as: 'locale_switch'
end
