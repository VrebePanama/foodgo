class SupermercadoController < ApplicationController
  def new
  end

  def create
    almacen = Supermercado.new(supermercado_params)
    if almacen.save
      redirect_to url_for(:controller => :supermercado, :action => :index)
    else
      redirect_to redirect_to url_for(:controller => :supermercado, :action => :new)
    end
  end

  def index
    @supermercados = Supermercado.all.group_by {|supermercado| supermercado.region }
  end

  def show
    @supermercado = Supermercado.find(params[:id])
  end

  private

  def supermercado_params
    params.require(:supermercado).permit(:nombre, :direccion, :numero_telefono,:hora_de_apertura,:hora_de_cierre,:region)
  end
end
