json.extract! presupuesto, :id, :user_id, :categoria_id, :monto, :estado, :fecha_inicio, :fecha_fin, :borrado, :created_at, :updated_at
json.url presupuesto_url(presupuesto, format: :json)
