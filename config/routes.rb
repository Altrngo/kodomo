Rails.application.routes.draw do
  devise_for :users
  root to: 'babies#index'
  
  resources :babies, only: [:index, :new, :create] do
    resources :events, only: [ :new, :create ]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
