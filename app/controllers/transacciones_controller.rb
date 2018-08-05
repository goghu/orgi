class TransaccionesController < ApplicationController
  before_action :set_transaccione, only: [:show, :edit, :update, :destroy]

  layout "template"
  # GET /transacciones
  # GET /transacciones.json
  def index
    # @transacciones = Transaccione.all
    respond_to do |format|
      format.html
      format.json { render json: TransaccionesDatatable.new(view_context) }
    end
  end

  # GET /transacciones/1
  # GET /transacciones/1.json
  def show
  end

  # GET /transacciones/new
  def new
    @transaccione = Transaccione.new
  end

  # GET /transacciones/1/edit
  def edit
  end

  # POST /transacciones
  # POST /transacciones.json
  def create
    @transaccione = Transaccione.new(transaccione_params)

    respond_to do |format|
      if @transaccione.save
        format.html { redirect_to @transaccione, notice: 'Transaccione was successfully created.' }
        format.json { render :show, status: :created, location: @transaccione }
      else
        format.html { render :new }
        format.json { render json: @transaccione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transacciones/1
  # PATCH/PUT /transacciones/1.json
  def update
    respond_to do |format|
      if @transaccione.update(transaccione_params)
        format.html { redirect_to @transaccione, notice: 'Transaccione was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaccione }
      else
        format.html { render :edit }
        format.json { render json: @transaccione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transacciones/1
  # DELETE /transacciones/1.json
  def destroy
    @transaccione.destroy
    respond_to do |format|
      format.html { redirect_to transacciones_url, notice: 'Transaccione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaccione
      @transaccione = Transaccione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaccione_params
      params.require(:transaccione).permit(:user_id, :categoria_id, :proyecto_id, :monto, :tipo, :nota, :estado, :fecha, :borrado)
    end
end
