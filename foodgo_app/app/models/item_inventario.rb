class ItemInventario < ActiveRecord::Base
  acts_as_taggable
  has_many :compras
  has_many :ordens, :through => :compras


end
