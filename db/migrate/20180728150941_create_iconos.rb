class CreateIconos < ActiveRecord::Migration[5.1]
  def change
    create_table :iconos do |t|
      t.string :nombre, :limit => 80
      t.string :direccion, :limit => 255

      t.timestamps
    end
  end
end
