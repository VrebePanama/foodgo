class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :contraseña
      t.string :email
      t.string :tipo

      t.timestamps
    end
  end
end
