Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#index'
        get '/:id/items', to: 'items#index'
        get '/:id/invoices', to: 'invoice_items#index'
        get '/:id/revenue', to: 'revenue#show'
        get '/most_revenue', to: 'most_revenue#index'
        get '/most_items', to: 'most_items#index'
        get '/revenue', to: 'revenue#index'
        get '/:id/favorite_customer', to: 'customer#show'
      end
      resources :merchants, only: [:index, :show]

      namespace :items do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#index'
        get 'most_revenue', to: 'revenue#index'
        get 'most_items', to: 'item#index'
        get '/:id/merchant', to: 'merchant#show'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/best_day', to: 'best_day#show'
      end
      resources :items, only: [:index, :show]

      namespace :transactions do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#index'
        get '/:id/invoice', to: 'invoices#show'
      end
      resources :transactions, only: [:index, :show]

      namespace :customers do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#index'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/favorite_merchant', to: 'merchant#show'
      end
      resources :customers, only: [:index, :show]

      namespace :invoices do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/items', to: 'items#index'
        get '/:id/customer', to: 'customer#show'
        get '/:id/merchant', to: 'merchant#show'
      end
      resources :invoices, only: [:index, :show]

      namespace :invoice_items do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get '/random', to: 'random#index'
        get '/:id/invoice', to: 'invoice#show'
        get '/:id/item', to: 'item#show'
      end
      resources :invoice_items, only: [:index, :show]
    end
  end
end
