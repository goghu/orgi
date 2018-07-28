class CreateTransacciones < ActiveRecord::Migration[5.1]
  def change
    create_table :transacciones do |t|
      t.integer :user_id
      t.integer :categoria_id
      t.integer :proyecto_id
      t.decimal :monto
      t.string :tipo, :limit => 30
      t.string :nota, :limit => 255
      t.string :estado, :limit => 20
      t.date :fecha
      t.datetime :borrado

      t.timestamps
    end
  end
end
