json.extract! proyecto, :id, :user_id, :cliente_id, :nombre, :monto, :estado, :fecha_inicio, :fecha_fin, :borrado, :created_at, :updated_at
json.url proyecto_url(proyecto, format: :json)
