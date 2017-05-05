Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get 'find', to: "find#show"
        get 'find_all', to: "find#index"
        get 'random', to: "random#show"
        get 'most_revenue', to: "most_revenue#index"
        get 'most_items', to: "most_items#index"
        get 'revenue', to: "revenue#show"
      end

      resources :merchants, only: [:index, :show] do
        get 'items', to: "merchants/items#index"
        get 'invoices', to: "merchants/invoices#index"
        get 'revenue', to: "merchants/revenue#show"
        get 'favorite_customer', to: "merchants/favorite_customer#show"
      end

      namespace :items do
        get 'find', to: "find#show"
        get 'find_all', to: "find#index"
        get 'random', to: "random#show"
        get 'most_revenue', to: "most_revenue#index"
        get 'most_items', to: "most_items#index"
      end

      resources :items, only: [:index, :show] do
        get 'invoice_items', to: "items/invoice_items#index"
        get 'merchant', to: "items/merchant#index"
        get 'best_day', to: "items/best_day#show"
      end

      namespace :customers do
        get 'find', to: "find#show"
        get 'find_all', to: "find#index"
        get 'random', to: "random#show"
      end

      resources :customers, only: [:index, :show] do
        get 'invoices', to: "customers/invoices#index"
        get 'transactions', to: "customers/transactions#index"
        get 'favorite_merchant', to: "customers/favorite_merchant#show"
      end

      namespace :transactions do
        get 'find', to: "find#show"
        get 'find_all', to: "find#index"
        get 'random', to: "random#show"
      end

      resources :transactions, only: [:index, :show] do
        get 'invoice', to: "transactions/invoice#show"
      end


      namespace :invoice_items do
        get 'find', to: "find#show"
        get 'find_all', to: "find#index"
        get 'random', to: "random#show"
      end

      resources :invoice_items, only: [:index, :show] do
        get 'invoice', to: 'invoice_items/invoice#show'
        get 'item', to: 'invoice_items/item#show'
      end

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
