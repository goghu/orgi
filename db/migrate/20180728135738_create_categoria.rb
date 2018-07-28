class CreateCategoria < ActiveRecord::Migration[5.1]
  def change
    create_table :categoria do |t|
      t.integer :user_id
      t.integer :icon_id
      t.string :nombre, :limit => 80
      t.string :tipo, :limit => 30
      t.string :movimiento, :limit => 20
      t.string :descripcion, :limit => 255
      t.datetime :borrado

      t.timestamps
    end
  end
end
