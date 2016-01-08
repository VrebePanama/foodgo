class Usuario < ActiveRecord::Base
  self.inheritance_column = :tipo

  def self.tipos
    ["Administrador","Cliente","Courier"]
  end
end

# class Administrador < Usuario; end
# class Cliente < Usuario; end
# class Courier < Usuario; end