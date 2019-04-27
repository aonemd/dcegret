Rails.application.routes.draw do
  root to: 'pages#index'

  namespace :api, default: { format: :json } do
    namespace :v1 do
      post 'sign_up', to: 'registrations#create'
      post 'sign_in', to: 'sessions#create'

      namespace :accounts do
        resources :relationships, only: [:create, :destroy] do
          member do
            get :is_following
          end
        end
        resources :posts, only: [:index, :create]
      end

      resources :accounts, only: [:index, :show] do
        member do
          get :following, :followers
        end
      end

      resources :posts, only: [:index] do
        member do
          get :by_account
        end
      end

      get 'timeline', to: 'timeline#index'
    end
  end
end
