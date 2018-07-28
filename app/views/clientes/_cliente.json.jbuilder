json.extract! cliente, :id, :user_id, :nombre, :telefono, :estado, :observaciones, :borrado, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
