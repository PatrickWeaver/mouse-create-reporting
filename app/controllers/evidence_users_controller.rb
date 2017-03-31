class EvidenceUsersController < ApplicationController
  before_action :set_evidence_user, only: [:show, :edit, :update, :destroy]

  # GET /evidence_users
  # GET /evidence_users.json
  def index
    @evidence_users = EvidenceUser.all
  end

  # GET /evidence_users/1
  # GET /evidence_users/1.json
  def show
  end

  # GET /evidence_users/new
  def new
    @evidence_user = EvidenceUser.new
  end

  # GET /evidence_users/1/edit
  def edit
  end

  # POST /evidence_users
  # POST /evidence_users.json
  def create
    @evidence_user = EvidenceUser.new(evidence_user_params)

    respond_to do |format|
      if @evidence_user.save
        format.html { redirect_to @evidence_user, notice: 'Evidence user was successfully created.' }
        format.json { render :show, status: :created, location: @evidence_user }
      else
        format.html { render :new }
        format.json { render json: @evidence_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evidence_users/1
  # PATCH/PUT /evidence_users/1.json
  def update
    respond_to do |format|
      if @evidence_user.update(evidence_user_params)
        format.html { redirect_to @evidence_user, notice: 'Evidence user was successfully updated.' }
        format.json { render :show, status: :ok, location: @evidence_user }
      else
        format.html { render :edit }
        format.json { render json: @evidence_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evidence_users/1
  # DELETE /evidence_users/1.json
  def destroy
    @evidence_user.destroy
    respond_to do |format|
      format.html { redirect_to evidence_users_url, notice: 'Evidence user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evidence_user
      @evidence_user = EvidenceUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evidence_user_params
      params.require(:evidence_user).permit(:evidence_id, :user_id, :created_at, :updated_at)
    end
end
