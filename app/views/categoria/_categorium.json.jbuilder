json.extract! categorium, :id, :user_id, :icon_id, :nombre, :tipo, :movimiento, :descripcion, :borrado, :created_at, :updated_at
json.url categorium_url(categorium, format: :json)
