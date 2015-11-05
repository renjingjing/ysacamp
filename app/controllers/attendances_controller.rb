class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show,:edit, :update, :destroy]
  before_action :find_user
  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.all
    if params[:search]
        @attendances = Attendance.search(params[:search]).order("#{params[:order]}")
      else
        @attendances = Attendance.order("#{params[:order]}").page(params[:page])
    end
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    # @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit

  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.user_id = @user.id
    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @user, notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        format.js   { render :create_success}
      else
        flash[:alert] = "Attendance wasn't created"
        format.js   {render :create_failure}
      end
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to user_path(@user), notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
        format.js   { render :update}
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@user), notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render :destroy}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_attendance
    @attendance = Attendance.find params[:id]
  end

  def find_user
    @user = User.find params[:user_id]
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def attendance_params
    params.require(:attendance).permit(
                                      :date_enrollment,
                                      :class_credit,
                                      :postpone,
                                      :finished,
                                      :note,
                                      :course_unit_id,
                                      :classtimetable_id
                                      )
    # , :attendanted_record[]
  end
end
