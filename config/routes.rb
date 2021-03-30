Rails.application.routes.draw do
  devise_for :users
  root to: 'babies#index'
  
  resources :babies, only: [:index] do
    resources :events, only: [ :choose_type, :new, :create ] do
      collection do
        get 'choose_type'
      end
    end
  end

  # get '/babies/:id/events/choose_type', to: 'events#choose_type', as: 'event_type'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
