class SessionsController < ApplicationController
  def new
  end

  def create
    usuario = Usuario.find_by_email(params[:email])

    if usuario && usuario.authenticate(params[:password])
      session[:usuario_id] = usuario.id
      redirect_to url_for(:controller => :supermercado, :action => :index)
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to '/login'
  end

end
