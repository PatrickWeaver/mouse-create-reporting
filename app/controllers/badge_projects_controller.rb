class BadgeProjectsController < ApplicationController
  before_action :set_badge_project, only: [:show, :edit, :update, :destroy]

  # GET /badge_projects
  # GET /badge_projects.json
  def index
    @badge_projects = BadgeProject.all
  end

  # GET /badge_projects/1
  # GET /badge_projects/1.json
  def show
  end

  # GET /badge_projects/new
  def new
    @badge_project = BadgeProject.new
  end

  # GET /badge_projects/1/edit
  def edit
  end

  # POST /badge_projects
  # POST /badge_projects.json
  def create
    @badge_project = BadgeProject.new(badge_project_params)

    respond_to do |format|
      if @badge_project.save
        format.html { redirect_to @badge_project, notice: 'Badge project was successfully created.' }
        format.json { render :show, status: :created, location: @badge_project }
      else
        format.html { render :new }
        format.json { render json: @badge_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /badge_projects/1
  # PATCH/PUT /badge_projects/1.json
  def update
    respond_to do |format|
      if @badge_project.update(badge_project_params)
        format.html { redirect_to @badge_project, notice: 'Badge project was successfully updated.' }
        format.json { render :show, status: :ok, location: @badge_project }
      else
        format.html { render :edit }
        format.json { render json: @badge_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /badge_projects/1
  # DELETE /badge_projects/1.json
  def destroy
    @badge_project.destroy
    respond_to do |format|
      format.html { redirect_to badge_projects_url, notice: 'Badge project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_badge_project
      @badge_project = BadgeProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_project_params
      params.require(:badge_project).permit(:badge_id, :project_id, :created_at, :updated_at)
    end
end
