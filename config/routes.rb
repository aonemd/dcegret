Rails.application.routes.draw do
  root to: 'pages#index'

  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :posts, only: [:index, :create]
      get 'timeline', to: 'timeline#index'
    end
  end
end
