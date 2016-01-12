class Usuario < ActiveRecord::Base
  has_many :ordens
  self.inheritance_column = :tipo
  has_secure_password

  def self.tipos
    ["Administrador","Cliente","Courier"]
  end
end

# class Administrador < Usuario; end
# class Cliente < Usuario; end
# class Courier < Usuario; end