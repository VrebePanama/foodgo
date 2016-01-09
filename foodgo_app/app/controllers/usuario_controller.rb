class UsuarioController < ApplicationController
  def new
  end

  def create
    usuario = Usuario.new(usuario_params)
    if usuario.save
      session[:usuario_id] = usuario.id
      redirect_to url_for(:controller => :supermercado, :action => :index)
    else
      redirect_to '/signup'
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nombre, :email, :password,:password_confirmation,:tipo)
  end

end
