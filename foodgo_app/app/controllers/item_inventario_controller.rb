class ItemInventarioController < ApplicationController
  def new
  end

  def create
    item_inventario = ItemInventario.new(item_inventario_params)
    supermercado = Supermercado.find(params[:supermercado_id])
    supermercado.item_inventarios << item_inventario
    if item_inventario.save
      redirect_to url_for(:controller => :supermercado, :action => :show, :id => params[:supermercado_id])
    else
      redirect_to url_for(:controller => :item_inventario, :action => :new)
    end
  end

  def edit
    @item_inventario = ItemInventario.find(params[:id])
  end

  def update
     @item_inventario = ItemInventario.find(params[:id])
     if @item_inventario.update_attributes(item_inventario_params)
      redirect_to supermercado_path(params[:supermercado_id])
     else
       render 'edit'
     end
   end

  private

  def item_inventario_params
    params.require(:item_inventario).permit(:supermercado_id, :tag_list, :nombre_producto, :cantidad_disponible, :precio,:unidad)
  end
end
