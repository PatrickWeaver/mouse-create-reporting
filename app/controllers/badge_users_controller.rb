class BadgeUsersController < ApplicationController
  before_action :set_badge_user, only: [:show, :edit, :update, :destroy]

  # GET /badge_users
  # GET /badge_users.json
  def index
    @badge_users = BadgeUser.all
  end

  # GET /badge_users/1
  # GET /badge_users/1.json
  def show
  end

  # GET /badge_users/new
  def new
    @badge_user = BadgeUser.new
  end

  # GET /badge_users/1/edit
  def edit
  end

  # POST /badge_users
  # POST /badge_users.json
  def create
    @badge_user = BadgeUser.new(badge_user_params)

    respond_to do |format|
      if @badge_user.save
        format.html { redirect_to @badge_user, notice: 'Badge user was successfully created.' }
        format.json { render :show, status: :created, location: @badge_user }
      else
        format.html { render :new }
        format.json { render json: @badge_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /badge_users/1
  # PATCH/PUT /badge_users/1.json
  def update
    respond_to do |format|
      if @badge_user.update(badge_user_params)
        format.html { redirect_to @badge_user, notice: 'Badge user was successfully updated.' }
        format.json { render :show, status: :ok, location: @badge_user }
      else
        format.html { render :edit }
        format.json { render json: @badge_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /badge_users/1
  # DELETE /badge_users/1.json
  def destroy
    @badge_user.destroy
    respond_to do |format|
      format.html { redirect_to badge_users_url, notice: 'Badge user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_badge_user
      @badge_user = BadgeUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_user_params
      params.require(:badge_user).permit(:code, :badge_id, :user_id, :issuer_id, :awarded, :evidence_id, :requirements, :eligibility_dt, :created_at, :updated_at)
    end
end
