class CurriculasController < ApplicationController
  before_action :set_curricula, only: [:show, :edit, :update, :destroy]

  # GET /curriculas
  # GET /curriculas.json
  def index
    @curriculas = Curricula.all
  end

  # GET /curriculas/1
  # GET /curriculas/1.json
  def show
  end

  # GET /curriculas/new
  def new
    @curricula = Curricula.new
  end

  # GET /curriculas/1/edit
  def edit
  end

  # POST /curriculas
  # POST /curriculas.json
  def create
    @curricula = Curricula.new(curricula_params)

    respond_to do |format|
      if @curricula.save
        format.html { redirect_to @curricula, notice: 'Curricula was successfully created.' }
        format.json { render :show, status: :created, location: @curricula }
      else
        format.html { render :new }
        format.json { render json: @curricula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curriculas/1
  # PATCH/PUT /curriculas/1.json
  def update
    respond_to do |format|
      if @curricula.update(curricula_params)
        format.html { redirect_to @curricula, notice: 'Curricula was successfully updated.' }
        format.json { render :show, status: :ok, location: @curricula }
      else
        format.html { render :edit }
        format.json { render json: @curricula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculas/1
  # DELETE /curriculas/1.json
  def destroy
    @curricula.destroy
    respond_to do |format|
      format.html { redirect_to curriculas_url, notice: 'Curricula was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curricula
      @curricula = Curricula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curricula_params
      params.require(:curricula).permit(:title, :created_at, :updated_at)
    end
end
