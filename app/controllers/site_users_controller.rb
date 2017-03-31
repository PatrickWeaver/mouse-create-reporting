class SiteUsersController < ApplicationController
  before_action :set_site_user, only: [:show, :edit, :update, :destroy]

  # GET /site_users
  # GET /site_users.json
  def index
    @site_users = SiteUser.all
  end

  # GET /site_users/1
  # GET /site_users/1.json
  def show
  end

  # GET /site_users/new
  def new
    @site_user = SiteUser.new
  end

  # GET /site_users/1/edit
  def edit
  end

  # POST /site_users
  # POST /site_users.json
  def create
    @site_user = SiteUser.new(site_user_params)

    respond_to do |format|
      if @site_user.save
        format.html { redirect_to @site_user, notice: 'Site user was successfully created.' }
        format.json { render :show, status: :created, location: @site_user }
      else
        format.html { render :new }
        format.json { render json: @site_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_users/1
  # PATCH/PUT /site_users/1.json
  def update
    respond_to do |format|
      if @site_user.update(site_user_params)
        format.html { redirect_to @site_user, notice: 'Site user was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_user }
      else
        format.html { render :edit }
        format.json { render json: @site_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_users/1
  # DELETE /site_users/1.json
  def destroy
    @site_user.destroy
    respond_to do |format|
      format.html { redirect_to site_users_url, notice: 'Site user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_user
      @site_user = SiteUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_user_params
      params.require(:site_user).permit(:user_id, :site_id, :code, :created_at, :updated_at)
    end
end
