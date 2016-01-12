class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_orden
    @current_orden ||= Orden.where(usuario_id: current_user.id, estado_de_orden: "en progreso")[0]
  end

  def current_user
    @current_user ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end

  helper_method :current_orden
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end
end
