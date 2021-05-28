Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   namespace :api do
    namespace :v1 do

      resources :items, module: :items do
        resources :merchant, only: [:index]
        collection do
          get '/find_all', to: 'search#find_all_by'
        end
       end
      
      resources :merchants, module: :merchants do
        resources :items, controller: 'items', only: [:index]
        collection do
          get '/find', to: 'search#find'
        end
      end

      namespace :revenue do
        resources :merchants, only: [:index, :show]
        resources :unshipped, only: [:index]
        resources :items, only: [:index]
      end
    end
   end
end