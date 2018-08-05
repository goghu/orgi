class TransaccionesDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Transaccione.id", cond: :eq },
      categoria: { source: "Transaccione.categoria_id", cond: :eq },
      proyecto: { source: "Transaccione.proyecto_id", cond: :eq },
      nota: { source: "Transaccione.nota", cond: :eq },
      monto: { source: "Transaccione.monto", cond: :eq },
      fecha: { source: "Transaccione.fecha", cond: :eq }
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        categoria: record.categorium.nombre,
        proyecto: record.proyecto.nombre,
        nota: record.nota,
        monto: record.monto,
        fecha: record.fecha
      }
    end
  end

  private

  def get_raw_records
    # insert query here
    Transaccione.where(borrado: nil).order('created_at DESC')
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
