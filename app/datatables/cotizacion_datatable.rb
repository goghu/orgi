class CotizacionDatatable < AjaxDatatablesRails::Base

  def_delegators :@view, :productos_path

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      nombre: { source: "Producto.nombre", cond: :like },
      codigo: { source: "Producto.codigo", cond: :like },
      descripcion: { source: "Producto.descripcion", cond: :like },
      precio: { source: "Producto.precio", cond: :eq },
      categoria: { source: "Categorium.nombre", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        codigo: record.codigo,
        nombre: record.nombre,
        categoria: record.categorium.nombre,
        precio: record.precio,
        nose: dt_actions(record.id),
        dprecios: losprecios(record.id)
      }
    end
  end

  private

  def get_raw_records
    # insert query here

    Producto.where("productos.deleted": nil)
    .joins("LEFT JOIN categoria ON categoria.id = productos.categoria_id")
    .order('created_at DESC')
    # .joins('categorias')
    
    
  end

  def dt_actions(idPropucto)
    lispaque = Paquete.where(deleted: nil,producto_id: idPropucto)
    cadena_opcion = ''
    lispaque.each do |paquete|
      cadena_opcion = cadena_opcion + '<option value="'+paquete.id.to_s+'" data-unidades="'+paquete.cantidad_real.to_s+'">'+paquete.nombre+'</option>'
    end
    # opciones = options_for_select(lispaque)
    ('<select class="form-control sel-paque"><option value="" data-unidades="1">Unidad</option>'+cadena_opcion+'</select><span class="badge badge-success cant_total_p"></span>').html_safe
  end


  def losprecios(idPropucto)
    (RangosPrecio.where(borrado: nil,producto_id: idPropucto).order('precio DESC').map {|p| {minimo: p.minimo,maximo: p.maximo,precio: p.precio}} ).to_json.html_safe
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
