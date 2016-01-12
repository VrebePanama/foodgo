class CreateOrdens < ActiveRecord::Migration
  def change
    create_table :ordens do |t|
      t.belongs_to :usuario, index:true
      t.string :direccion
      t.string :estado_de_orden
      t.string :plazo_de_entrega
      t.timestamps
    end
  end
end
