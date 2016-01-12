class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.belongs_to :orden, index: true
      t.belongs_to :item_inventario, index:true
      t.integer :cantidad_comprada, index:true
      t.timestamps
    end
  end
end
