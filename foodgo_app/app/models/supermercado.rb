class Supermercado < ActiveRecord::Base
  has_many :item_inventarios
end