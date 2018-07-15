class CotizacioneDatatable < AjaxDatatablesRails::Base


  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      numero: { source: "Cotizacione.numero", cond: :eq },
      fecha: { source: "fecha", cond: filter_fecha_condition, searchable:true },
      nombre_cliente: { source: "nombre_cliente", cond: filter_nombre_cliente_condition, searchable:true },
      total_bs: { source: "total_bs", cond: filter_total_bs_condition, searchable:false,orderable: true },
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
        total_bs: record.total_bs,
        swventa: record.swventa
      }
    end
  end

  private

  def get_raw_records
    # insert query here
    Cotizacione.select('cotizaciones.numero','DATE_FORMAT(cotizaciones.created_at, "%d/%m/%Y %H:%i") as fecha','cotizaciones.almacene_id','cotizaciones.cliente','clientes.nombre as nombre_cliente','SUM(cotizaciones.precio_cot*(cotizaciones.cantidad*IFNULL(paquetes.cantidad_real,1))) as total_bs','IFNULL(ventas.id,false) as swventa')
    .where('cotizaciones.deleted IS NULL')
    .joins("LEFT JOIN users as clientes ON clientes.id = cotizaciones.cliente")
    .joins("LEFT JOIN paquetes ON paquetes.id = cotizaciones.paquete_id")
    .joins("LEFT JOIN ventas ON ventas.cotizacione_id = cotizaciones.id AND ISNULL(ventas.deleted)")
    .group('cotizaciones.numero')
    .order("cotizaciones.numero DESC")
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
      Arel.sql("DATE_FORMAT(cotizaciones.created_at, '%d/%m/%Y %H:%i') LIKE '%#{column}%'")
    }
  end

  def filter_total_bs_condition
    ->(column) {
      Arel.sql("SUM(cotizaciones.precio_cot*(cotizaciones.cantidad*IFNULL(paquetes.cantidad_real,1))) LIKE '%#{column}%'")
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
