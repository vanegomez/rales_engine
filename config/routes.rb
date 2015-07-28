Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'customers/random'   => 'customers#random'
      get 'customers/find'     => 'customers#find'
      get 'customers/find_all' => 'customer#find_all'

      resources :customers, except: [:new, :edit]
      resources :merchants, except: [:new, :edit]
      resources :items, except: [:new, :edit]
      resources :invoice_items, except: [:new, :edit]
      resources :transactions, except: [:new, :edit]
    end
  end
end
