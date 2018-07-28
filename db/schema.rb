# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180728150941) do

  create_table "categoria", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "icon_id"
    t.string "nombre", limit: 80
    t.string "tipo", limit: 30
    t.string "movimiento", limit: 20
    t.string "descripcion"
    t.datetime "borrado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "nombre", limit: 80
    t.string "telefono", limit: 50
    t.string "estado", limit: 30
    t.string "observaciones"
    t.datetime "borrado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "iconos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre", limit: 80
    t.string "direccion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "presupuestos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "categoria_id"
    t.decimal "monto", precision: 10
    t.string "nombre", limit: 80
    t.string "estado", limit: 15
    t.date "fecha_inicio"
    t.date "fecha_fin"
    t.datetime "borrado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proyectos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "cliente_id"
    t.string "nombre"
    t.decimal "monto", precision: 10, scale: 2
    t.string "estado", limit: 30
    t.date "fecha_inicio"
    t.date "fecha_fin"
    t.datetime "borrado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tareas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "proyecto_id"
    t.integer "categoria_id"
    t.string "descripcion"
    t.string "prioridad", limit: 15
    t.datetime "fecha_inicio"
    t.datetime "fecha_fin"
    t.string "tiempo"
    t.datetime "borrado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transacciones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "categoria_id"
    t.integer "proyecto_id"
    t.decimal "monto", precision: 10
    t.string "tipo", limit: 30
    t.string "nota"
    t.string "estado", limit: 20
    t.date "fecha"
    t.datetime "borrado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre"
    t.string "password_salt", limit: 240
    t.string "password_hash", limit: 240
    t.string "username", limit: 240
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "rol"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
