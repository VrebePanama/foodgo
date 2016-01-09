class CreateItemInventario < ActiveRecord::Migration
  def change
    create_table :item_inventarios do |t|
      t.belongs_to :
    end
  end
end
