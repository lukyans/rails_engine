Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get 'find', to: "find#show"
        get 'find_all', to: "find#index"
        get 'random', to: "random#show"
      end

      resources :merchants, only: [:index, :show]

      namespace :items do
        get 'find', to: "find#show"
        get 'find_all', to: "find#index"
        get 'random', to: "random#show"
      end

      resources :items, only: [:index, :show]
      
      namespace :customers do
        get 'find', to: "find#show"
        get 'find_all', to: "find#index" 
        get 'random', to: "random#show"
      end
    
      resources :customers, only: [:index, :show]

      namespace :transactions do
        get 'find', to: "find#show"
        get 'find_all', to: "find#index" 
        get 'random', to: "random#show"
      end
    
      resources :transactions, only: [:index, :show]

    end
  end
end
