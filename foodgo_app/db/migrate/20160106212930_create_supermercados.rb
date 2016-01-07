class CreateSupermercados < ActiveRecord::Migration
  def change
    create_table :supermercados do |t|
      t.string :nombre
      t.string :direccion
      t.string :numero_telefono
      t.datetime :hora_de_apertura
      t.datetime :hora_de_cierre
      t.string :region
    end
  end
end
