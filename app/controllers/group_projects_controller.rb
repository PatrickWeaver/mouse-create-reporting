class GroupProjectsController < ApplicationController
  before_action :set_group_project, only: [:show, :edit, :update, :destroy]

  # GET /group_projects
  # GET /group_projects.json
  def index
    @group_projects = GroupProject.all
  end

  # GET /group_projects/1
  # GET /group_projects/1.json
  def show
  end

  # GET /group_projects/new
  def new
    @group_project = GroupProject.new
  end

  # GET /group_projects/1/edit
  def edit
  end

  # POST /group_projects
  # POST /group_projects.json
  def create
    @group_project = GroupProject.new(group_project_params)

    respond_to do |format|
      if @group_project.save
        format.html { redirect_to @group_project, notice: 'Group project was successfully created.' }
        format.json { render :show, status: :created, location: @group_project }
      else
        format.html { render :new }
        format.json { render json: @group_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_projects/1
  # PATCH/PUT /group_projects/1.json
  def update
    respond_to do |format|
      if @group_project.update(group_project_params)
        format.html { redirect_to @group_project, notice: 'Group project was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_project }
      else
        format.html { render :edit }
        format.json { render json: @group_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_projects/1
  # DELETE /group_projects/1.json
  def destroy
    @group_project.destroy
    respond_to do |format|
      format.html { redirect_to group_projects_url, notice: 'Group project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_project
      @group_project = GroupProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_project_params
      params.require(:group_project).permit(:group_id, :project_id, :order, :created_at, :updated_at)
    end
end
