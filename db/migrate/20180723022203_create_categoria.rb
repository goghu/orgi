class CreateCategoria < ActiveRecord::Migration[5.1]
  def change
    create_table :categoria do |t|
      t.integer :user_id
      t.integer :icono_id
      t.string :nombre, :limit => 50
      t.string :tipo, :limit => 30
      t.string :movimiento, :limit => 30
      t.string :descripcion, :limit => 500
      t.datetime :borrado

      t.timestamps
    end
  end
end