class CreateItemInventarios < ActiveRecord::Migration
  def change
    create_table :item_inventarios do |t|
      t.belongs_to :supermercado, index:true
      t.string :nombre_producto
      t.integer :cantidad_disponible
      t.integer :precio
      t.string :unidad
      t.timestamps
    end
  end
end
