json.extract! transaccione, :id, :user_id, :categoria_id, :proyecto_id, :monto, :tipo, :nota, :estado, :fecha, :borrado, :created_at, :updated_at
json.url transaccione_url(transaccione, format: :json)
