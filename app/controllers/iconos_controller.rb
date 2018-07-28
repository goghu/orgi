class IconosController < ApplicationController
  before_action :set_icono, only: [:show, :edit, :update, :destroy]

  # GET /iconos
  # GET /iconos.json
  def index
    @iconos = Icono.all
  end

  # GET /iconos/1
  # GET /iconos/1.json
  def show
  end

  # GET /iconos/new
  def new
    @icono = Icono.new
  end

  # GET /iconos/1/edit
  def edit
  end

  # POST /iconos
  # POST /iconos.json
  def create
    @icono = Icono.new(icono_params)

    respond_to do |format|
      if @icono.save
        format.html { redirect_to @icono, notice: 'Icono was successfully created.' }
        format.json { render :show, status: :created, location: @icono }
      else
        format.html { render :new }
        format.json { render json: @icono.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iconos/1
  # PATCH/PUT /iconos/1.json
  def update
    respond_to do |format|
      if @icono.update(icono_params)
        format.html { redirect_to @icono, notice: 'Icono was successfully updated.' }
        format.json { render :show, status: :ok, location: @icono }
      else
        format.html { render :edit }
        format.json { render json: @icono.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iconos/1
  # DELETE /iconos/1.json
  def destroy
    @icono.destroy
    respond_to do |format|
      format.html { redirect_to iconos_url, notice: 'Icono was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_icono
      @icono = Icono.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def icono_params
      params.require(:icono).permit(:nombre, :direccion)
    end
end
