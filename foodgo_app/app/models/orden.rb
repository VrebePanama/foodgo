class Orden < ActiveRecord::Base
  has_many :compras
  has_many :item_inventarios, :through => :compras

end
