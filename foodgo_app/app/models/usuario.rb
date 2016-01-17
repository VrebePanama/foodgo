class Usuario < ActiveRecord::Base
  has_many :ordens
  self.inheritance_column = :tipo
  has_secure_password

  def self.tipos
    ["Administrador","Cliente","Courier"]
  end

  def is_administrador?
    self.tipo == "Administrador"
  end

  def is_cliente?
    self.tipo == "Cliente"
  end

  def is_courier?
    self.tipo == "Courier"
  end
end

# class Administrador < Usuario; end
# class Cliente < Usuario; end
# class Courier < Usuario; end