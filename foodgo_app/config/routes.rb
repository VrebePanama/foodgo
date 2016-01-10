Rails.application.routes.draw do

  #root 'supermercado#index'
  # map.resources :supermercados do |supermercado|
  #   supermercado.resources :item_inventarios
  # end

  root to: 'sessions#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  get '/signup' => 'usuario#new'
  post '/usuarios' => 'usuario#create'

  resources :supermercado do
    resources :item_inventario
  end

end
