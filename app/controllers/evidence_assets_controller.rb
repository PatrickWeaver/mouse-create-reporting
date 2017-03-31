class EvidenceAssetsController < ApplicationController
  before_action :set_evidence_asset, only: [:show, :edit, :update, :destroy]

  # GET /evidence_assets
  # GET /evidence_assets.json
  def index
    @evidence_assets = EvidenceAsset.all
  end

  # GET /evidence_assets/1
  # GET /evidence_assets/1.json
  def show
  end

  # GET /evidence_assets/new
  def new
    @evidence_asset = EvidenceAsset.new
  end

  # GET /evidence_assets/1/edit
  def edit
  end

  # POST /evidence_assets
  # POST /evidence_assets.json
  def create
    @evidence_asset = EvidenceAsset.new(evidence_asset_params)

    respond_to do |format|
      if @evidence_asset.save
        format.html { redirect_to @evidence_asset, notice: 'Evidence asset was successfully created.' }
        format.json { render :show, status: :created, location: @evidence_asset }
      else
        format.html { render :new }
        format.json { render json: @evidence_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evidence_assets/1
  # PATCH/PUT /evidence_assets/1.json
  def update
    respond_to do |format|
      if @evidence_asset.update(evidence_asset_params)
        format.html { redirect_to @evidence_asset, notice: 'Evidence asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @evidence_asset }
      else
        format.html { render :edit }
        format.json { render json: @evidence_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evidence_assets/1
  # DELETE /evidence_assets/1.json
  def destroy
    @evidence_asset.destroy
    respond_to do |format|
      format.html { redirect_to evidence_assets_url, notice: 'Evidence asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evidence_asset
      @evidence_asset = EvidenceAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evidence_asset_params
      params.require(:evidence_asset).permit(:type_id, :evidence_id, :step_id, :step_order, :order, :content, :created_at, :updated_at)
    end
end
