Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :babies, only: [:index, :show, :new, :create] do
    get 'timeline' => 'events#timeline', on: :member, as: 'event_timeline'
    get 'details'
    resources :events, only: [:choose_type, :new, :create, :show] do
      collection do
        get 'choose_type'
        # get 'new/baby_bottles', to: 'baby_bottles#new', as: 'new_baby_bottle'
      end
    end
  end

  # get '/babies/:id/events/choose_type', to: 'events#choose_type', as: 'event_type'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
