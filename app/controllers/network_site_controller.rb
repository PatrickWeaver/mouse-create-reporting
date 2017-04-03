class NetworkSiteController < ApplicationController
  before_action :set_network_site, only: [:show, :edit, :update, :destroy]

  # GET /network_sites
  # GET /network_sites.json
  def index
    @network_sites = NetworkSite.all
  end

  # GET /network_sites/1
  # GET /network_sites/1.json
  def show
  end

  # GET /network_sites/new
  def new
    @network_site = NetworkSite.new
  end

  # GET /network_sites/1/edit
  def edit
  end

  # POST /network_sites
  # POST /network_sites.json
  def create
    @network_site = NetworkSite.new(network_site_params)

    respond_to do |format|
      if @network_site.save
        format.html { redirect_to @network_site, notice: 'Network site was successfully created.' }
        format.json { render :show, status: :created, location: @network_site }
      else
        format.html { render :new }
        format.json { render json: @network_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /network_sites/1
  # PATCH/PUT /network_sites/1.json
  def update
    respond_to do |format|
      if @network_site.update(network_site_params)
        format.html { redirect_to @network_site, notice: 'Network site was successfully updated.' }
        format.json { render :show, status: :ok, location: @network_site }
      else
        format.html { render :edit }
        format.json { render json: @network_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network_sites/1
  # DELETE /network_sites/1.json
  def destroy
    @network_site.destroy
    respond_to do |format|
      format.html { redirect_to network_sites_url, notice: 'Network site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network_site
      @network_site = NetworkSite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_site_params
      params.require(:network_site).permit(:network_id, :site_id)
    end
end
