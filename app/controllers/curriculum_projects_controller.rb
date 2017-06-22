class CurriculumProjectsController < ApplicationController
  before_action :set_curriculum_project, only: [:show, :edit, :update, :destroy]

  # GET /curriculum_projects
  # GET /curriculum_projects.json
  def index
    @curriculum_projects = CurriculumProject.all
  end

  # GET /curriculum_projects/1
  # GET /curriculum_projects/1.json
  def show
  end

  # GET /curriculum_projects/new
  def new
    @curriculum_project = CurriculumProject.new
  end

  # GET /curriculum_projects/1/edit
  def edit
  end

  # POST /curriculum_projects
  # POST /curriculum_projects.json
  def create
    @curriculum_project = CurriculumProject.new(curriculum_project_params)

    respond_to do |format|
      if @curriculum_project.save
        format.html { redirect_to @curriculum_project, notice: 'Curriculum project was successfully created.' }
        format.json { render :show, status: :created, location: @curriculum_project }
      else
        format.html { render :new }
        format.json { render json: @curriculum_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curriculum_projects/1
  # PATCH/PUT /curriculum_projects/1.json
  def update
    respond_to do |format|
      if @curriculum_project.update(curriculum_project_params)
        format.html { redirect_to @curriculum_project, notice: 'Curriculum project was successfully updated.' }
        format.json { render :show, status: :ok, location: @curriculum_project }
      else
        format.html { render :edit }
        format.json { render json: @curriculum_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculum_projects/1
  # DELETE /curriculum_projects/1.json
  def destroy
    @curriculum_project.destroy
    respond_to do |format|
      format.html { redirect_to curriculum_projects_url, notice: 'Curriculum project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum_project
      @curriculum_project = CurriculumProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curriculum_project_params
      params.require(:curriculum_project).permit(:curriculum_id, :project_id, :order, :created_at, :updated_at)
    end
end
