class SessionsController < ApplicationController
  def new
  end

  def create
    usuario = Usuario.find_by_email(params[:email])

    if usuario && usuario.authenticate(params[:password])
      session[:usuario_id] = usuario.id
      redirect_to supermercado_index_path
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to '/login'
  end

end
