json.extract! tarea, :id, :user_id, :proyecto_id, :categoria_id, :descripcion, :prioridad, :fecha_inicio, :fecha_fin, :tiempo, :borrado, :created_at, :updated_at
json.url tarea_url(tarea, format: :json)
