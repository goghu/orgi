class CreateClientes < ActiveRecord::Migration[5.1]
  def change
    create_table :clientes do |t|
      t.integer :user_id
      t.string :nombre, :limit => 80
      t.string :telefono, :limit => 50
      t.string :estado, :limit => 30
      t.string :observaciones, :limit => 255
      t.datetime :borrado

      t.timestamps
    end
  end
end
