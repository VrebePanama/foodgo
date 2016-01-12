class Compra < ActiveRecord::Base
  belongs_to :orden
  belongs_to :item_inventario
end
