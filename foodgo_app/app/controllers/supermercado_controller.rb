class SupermercadoController < ApplicationController
  def new
  end

  def create
  end

  def index
    @supermercados = Supermercado.all.group_by {|supermercado| supermercado.region }
  end
end
