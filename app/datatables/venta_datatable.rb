class VentaDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      numero: { source: "Venta.numero", cond: :like },
      fecha: { source: "fecha", cond: filter_fecha_condition, searchable:true },
      nombre_cliente: { source: "nombre_cliente", cond: filter_nombre_cliente_condition, searchable:true },
      total_venta: { source: "total_venta", cond: filter_total_venta_condition, searchable:false,orderable: true }
      
    }
  end

  def data
    records.map do |record|
      {
        # example:
        numero: record.numero,
        fecha: record.fecha,
        nombre_cliente: record.nombre_cliente,
        idcliente: record.cliente,
        idalmacen: record.almacene_id,
        total_venta: record.total_venta
      }
    end
  end

  private

  def get_raw_records
    # insert query here

    Venta.select('ventas.numero','DATE_FORMAT(ventas.created_at, "%d/%m/%Y %H:%i") as fecha','cotizaciones.almacene_id','cotizaciones.cliente','clientes.nombre as nombre_cliente','SUM(cotizaciones.precio_cot*(ventas.cantidad*IFNULL(paquetes.cantidad_real,1))) as total_venta')
    .where('ventas.deleted IS NULL')
    .joins("LEFT JOIN cotizaciones ON cotizaciones.id = ventas.cotizacione_id")
    .joins("LEFT JOIN users as clientes ON clientes.id = cotizaciones.cliente")
    .joins("LEFT JOIN paquetes ON paquetes.id = cotizaciones.paquete_id")
    .group('ventas.numero')
    .order("ventas.numero DESC")
    .distinct

  end


  def filter_nombre_cliente_condition
    ->(column) {
      Arel.sql("clientes.nombre LIKE '%#{column}%'")
    }
  end

  def filter_fecha_condition
    ->(column) {
      # Arel.sql("DATE_FORMAT(cotizaciones.created_at, '%d/%m/%Y %H:%i') LIKE '%#{column}%'")
      Arel.sql("DATE_FORMAT(ventas.created_at, '%d/%m/%Y %H:%i') LIKE '%#{column}%'")
    }
  end

  def filter_total_venta_condition
    ->(column) {
      Arel.sql("SUM(cotizaciones.precio_cot*(ventas.cantidad*IFNULL(paquetes.cantidad_real,1))) LIKE '%#{column}%'")
    }
  end

  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
