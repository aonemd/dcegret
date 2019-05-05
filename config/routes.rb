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
        resources :settings, only: [:index] do
          collection do
            put :update
          end
        end
      end

      resources :accounts, only: [:index, :show] do
        member do
          get :following, :followers
          put :accept_request
        end

        collection do
          get :requested_followers
        end
      end

      resources :posts, only: [:index] do
        member do
          get :by_account
        end

        resources :likes, only: [:create, :destroy], controller: 'posts/likes'
      end

      resources :conversations, only: [:index, :show, :create]

      namespace :remote do
        get 'posts', to: 'posts#index'
      end
    end

    namespace :v2 do
      post 'sign_up', to: 'registrations#create'
      post 'sign_in', to: 'sessions#create'
    end
  end
end
