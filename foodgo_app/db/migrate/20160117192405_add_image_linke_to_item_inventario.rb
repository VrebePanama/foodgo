class AddImageLinkeToItemInventario < ActiveRecord::Migration
  def change
    add_column :item_inventarios, :link_imagen, :string
  end
end
