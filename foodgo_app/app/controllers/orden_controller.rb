class OrdenController < ApplicationController
  def index
    @ordenes = Orden.where(usuario_id: current_user.id)
  end

  def orden_en_progreso
    @compras = current_orden.compras
    @items = @compras.map {|compra| ItemInventario.find(compra.item_inventario_id)}
    @item_compras = @compras.zip(@items)
  end

  def edit
    @orden = Orden.find(current_orden.id)
  end

  def update
     @orden = Orden.find(params[:id])
     if @orden.update_attributes(params[:orden].permit(:plazo_de_entrega,:direccion,:estado_de_orden))
      redirect_to supermercado_index_path
     else
      puts "CHECKOUT NOT PROCESSED"
       render 'edit'
     end
  end

   def show
    @orden = Orden.find(params[:id])
    @compras = @orden.compras
    @items = @compras.map {|compra| ItemInventario.find(compra.item_inventario_id)}
    @item_compras = @compras.zip(@items)
  end

  def destroy
    @orden = Orden.find(params[:id])
    @orden.destroy
    redirect_to ordenes_path
  end
end
