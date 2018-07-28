class CreateTareas < ActiveRecord::Migration[5.1]
  def change
    create_table :tareas do |t|
      t.integer :user_id
      t.integer :proyecto_id
      t.integer :categoria_id
      t.string :descripcion, :limit => 255
      t.string :prioridad, :limit => 15
      t.datetime :fecha_inicio
      t.datetime :fecha_fin
      t.string :tiempo
      t.datetime :borrado

      t.timestamps
    end
  end
end
