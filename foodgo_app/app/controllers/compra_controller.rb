class CompraController < ApplicationController
  def new
    @item = ItemInventario.find(params[:item_inventario_id])
  end

  def create
    compra = Compra.new(params[:compra].permit(:cantidad_comprada,:orden_id,:item_inventario_id))

    unless compra.orden_id
      puts " CREATE NEW ORDER "
      @orden = Orden.new
      @orden.usuario_id = current_user.id
      @orden.estado_de_orden = "en progreso"
      @orden.save
      compra.orden_id = @orden.id
    end

    if compra.save
      @item = ItemInventario.find(compra.item_inventario_id)
      @item.cantidad_disponible = @item.cantidad_disponible - compra.cantidad_comprada
      @item.save
      redirect_to supermercado_index_path
    else
      redirect_to compra_path(:item_inventario_id => @compra.item_inventario_id)
    end


  end
end
