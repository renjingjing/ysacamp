class CourseResourcesController < ApplicationController
  before_action :set_course_resource, only: [:show, :edit, :update, :destroy]

  # GET /course_resources
  # GET /course_resources.json
  def index
    @course_resources = CourseResource.all
  end

  # GET /course_resources/1
  # GET /course_resources/1.json
  def show
  end

  # GET /course_resources/new
  def new
    @course_resource = CourseResource.new
  end

  # GET /course_resources/1/edit
  def edit
  end

  # POST /course_resources
  # POST /course_resources.json
  def create
    @course_resource = CourseResource.new(course_resource_params)

    respond_to do |format|
      if @course_resource.save
        format.html { redirect_to @course_resource, notice: 'Course resource was successfully created.' }
        format.json { render :show, status: :created, location: @course_resource }
      else
        format.html { render :new }
        format.json { render json: @course_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_resources/1
  # PATCH/PUT /course_resources/1.json
  def update
    respond_to do |format|
      if @course_resource.update(course_resource_params)
        format.html { redirect_to @course_resource, notice: 'Course resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_resource }
      else
        format.html { render :edit }
        format.json { render json: @course_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_resources/1
  # DELETE /course_resources/1.json
  def destroy
    @course_resource.destroy
    respond_to do |format|
      format.html { redirect_to course_resources_url, notice: 'Course resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_resource
      @course_resource = CourseResource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_resource_params
      params.require(:course_resource).permit(:title, :content, :kind_id, :resource_file, :kind_id, :note)
    end
end
