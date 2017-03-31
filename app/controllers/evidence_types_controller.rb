class EvidenceTypesController < ApplicationController
  before_action :set_evidence_type, only: [:show, :edit, :update, :destroy]

  # GET /evidence_types
  # GET /evidence_types.json
  def index
    @evidence_types = EvidenceType.all
  end

  # GET /evidence_types/1
  # GET /evidence_types/1.json
  def show
  end

  # GET /evidence_types/new
  def new
    @evidence_type = EvidenceType.new
  end

  # GET /evidence_types/1/edit
  def edit
  end

  # POST /evidence_types
  # POST /evidence_types.json
  def create
    @evidence_type = EvidenceType.new(evidence_type_params)

    respond_to do |format|
      if @evidence_type.save
        format.html { redirect_to @evidence_type, notice: 'Evidence type was successfully created.' }
        format.json { render :show, status: :created, location: @evidence_type }
      else
        format.html { render :new }
        format.json { render json: @evidence_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evidence_types/1
  # PATCH/PUT /evidence_types/1.json
  def update
    respond_to do |format|
      if @evidence_type.update(evidence_type_params)
        format.html { redirect_to @evidence_type, notice: 'Evidence type was successfully updated.' }
        format.json { render :show, status: :ok, location: @evidence_type }
      else
        format.html { render :edit }
        format.json { render json: @evidence_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evidence_types/1
  # DELETE /evidence_types/1.json
  def destroy
    @evidence_type.destroy
    respond_to do |format|
      format.html { redirect_to evidence_types_url, notice: 'Evidence type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evidence_type
      @evidence_type = EvidenceType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evidence_type_params
      params.require(:evidence_type).permit(:name, :active, :icon, :validation, :messages, :created_at, :updated_at)
    end
end
