Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   namespace :api do
    namespace :v1 do
      resources :items, module: :items
      resources :merchants, module: :merchants do
        resources :items, controller: 'items', only: [:index]
      end
    end
   end
end
