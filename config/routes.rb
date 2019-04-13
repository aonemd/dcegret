Rails.application.routes.draw do
  root to: 'pages#index'

  namespace :api, default: { format: :json } do
    namespace :v1 do
      post 'sign_up', to: 'registrations#create'
      post 'sign_in', to: 'sessions#create'

      resources :posts, only: [:index, :create]
      get 'timeline', to: 'timeline#index'
    end
  end
end
