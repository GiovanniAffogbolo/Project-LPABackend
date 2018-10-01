Rails.application.routes.draw do
  post 'commandes/create', to: 'commandes#create'
  resources :pizzas
  resources :testjson
  resources :commandes
  
  #get 'commandes/index'
  #get 'commandes/show', to: 'commandes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
