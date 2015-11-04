class AttendancebooksController < ApplicationController
  def index
    @attendances = Attendance.all
    if params[:search]
      @attendances = Attendance.search(params[:search])
    else
      @attendances = Attendance.all
    end
  end

  def update
      respond_to do |format|
        aa=[]
        @attendance = Attendance.find params[:id]
        aa = @attendance.attendanted_record unless @attendance.attendanted_record == nil
        aa << formatted_date_short(Time.now)
        if @attendance.update(attendanted_record:aa)
          format.html { redirect_to to_day_attendancebooks_path(@attendance), notice: 'Attendance was successfully updated.' }
          format.json { render :to_day, status: :ok, location: @attendance }
          format.js   { render :update}
        else
          format.html { render :edit }
          format.json { render json: @attendance.errors, status: :unprocessable_entity }
        end
      end
  end

  def search_by_first_name
    if params[:search]
      @attendances = Attendance.search_by_first_name(params[:search])
    end
  end

  def to_day
    # @attendances = Attendance.all
    if params[:search]
        class_days = Attendance.
        search(params[:search]).order("#{params[:order]}")
      else
        @attendances = Attendance.order("#{params[:order]}")
      end
  end


end
