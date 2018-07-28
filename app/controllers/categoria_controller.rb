class CategoriaController < ApplicationController
  before_action :set_Categoria, only: [:show, :edit, :update, :destroy]

  # GET /categoria
  # GET /categoria.json
  def index
    @categoria = Categoria.all
  end

  # GET /categoria/1
  # GET /categoria/1.json
  def show
  end

  # GET /categoria/new
  def new
    @Categoria = Categoria.new
  end

  # GET /categoria/1/edit
  def edit
  end

  # POST /categoria
  # POST /categoria.json
  def create
    @Categoria = Categoria.new(Categoria_params)

    respond_to do |format|
      if @Categoria.save
        format.html { redirect_to @Categoria, notice: 'Categoria was successfully created.' }
        format.json { render :show, status: :created, location: @Categoria }
      else
        format.html { render :new }
        format.json { render json: @Categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoria/1
  # PATCH/PUT /categoria/1.json
  def update
    respond_to do |format|
      if @Categoria.update(Categoria_params)
        format.html { redirect_to @Categoria, notice: 'Categoria was successfully updated.' }
        format.json { render :show, status: :ok, location: @Categoria }
      else
        format.html { render :edit }
        format.json { render json: @Categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoria/1
  # DELETE /categoria/1.json
  def destroy
    @Categoria.destroy
    respond_to do |format|
      format.html { redirect_to categoria_url, notice: 'Categoria was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Categoria
      @Categoria = Categoria.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Categoria_params
      params.require(:Categoria).permit(:user_id, :icono_id, :nombre, :tipo, :movimiento, :descripcion, :borrado)
    end
end
