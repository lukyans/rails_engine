Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get 'find', to: "find#show"
        get 'find_all', to: "find#index"
        get 'random', to: "random#show"
      end

      resources :merchants, only: [:index, :show] do
        get 'items', to: "merchants/items#index"
        get 'invoices', to: "merchants/invoices#index"
      end

      namespace :items do
        get 'find', to: "find#show"
        get 'find_all', to: "find#index"
        get 'random', to: "random#show"
      end

      resources :items, only: [:index, :show] do
        get 'invoice_items', to: "items/invoice_items#index"
        get 'merchant', to: "items/merchant#show"
      end

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


      namespace :invoice_items do
        get 'find', to: "find#show"
        get 'find_all', to: "find#index"
        get 'random', to: "random#show"
      end

      resources :invoice_items, only: [:index, :show]

      namespace :invoices do
        get 'find', to: "find#show"
        get 'find_all', to: "find#index"
        get 'random', to: "random#show"
      end

      resources :invoices, only: [:index, :show] do
        get 'transactions', to: "invoices/transactions#index"
        get 'invoice_items', to: "invoices/invoice_items#index"
        get 'items', to: "invoices/items#index"
        get 'customer', to: "invoices/customer#show"
        get 'merchant', to: "invoices/merchant#show"
      end

    end
  end
end
