class CreatePresupuestos < ActiveRecord::Migration[5.1]
  def change
    create_table :presupuestos do |t|
      t.integer :user_id
      t.integer :categoria_id
      t.decimal :monto
      t.string :nombre, :limit => 80
      t.string :estado, :limit => 15
      t.date :fecha_inicio
      t.date :fecha_fin
      t.datetime :borrado

      t.timestamps
    end
  end
end
