Rails.application.routes.draw do

resources :stores do
    resources :records 
  end
  resources :stores do
    resources :managers
  end
  get '/graph', to: 'dashboards#graph'
    get '/stocklist', to: 'dashboards#stocklist'

root 'sessions#new'
  get '/login',  to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/logout',  to: 'sessions#destroy'
  
resources :stores do
   resources :sections do
      resources :groups do
        resources :items
      end
    end
  end
resources :owners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :stores
    end
  end
end
