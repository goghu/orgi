class CreateProyectos < ActiveRecord::Migration[5.1]
  def change
    create_table :proyectos do |t|
      t.integer :user_id
      t.integer :cliente_id
      t.string :nombre, :limit => 255
      t.decimal :monto, :precision => 10, :scale => 2
      t.string :estado, :limit => 30
      t.date :fecha_inicio
      t.date :fecha_fin
      t.datetime :borrado

      t.timestamps
    end
  end
end
