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

  get '/compra' => 'compra#new'
  post '/compra' => 'compra#create'

  get '/ordenes' => 'orden#index'
  get '/carrito' => 'orden#orden_en_progreso'
  get '/checkout' => 'orden#edit'
  get '/ordenes_totales' => 'orden#todas_las_ordenes'
  get '/ordenes_delivery' => 'orden#ordenes_a_buscar'

  resources :orden, only: [:edit,:update,:destroy,:show]

  resources :supermercado do
    resources :item_inventario
  end

end
