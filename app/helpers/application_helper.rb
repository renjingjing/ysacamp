module ApplicationHelper
  #those for course helper
  def find_course( course_unit_id )
    course_unit = CourseUnit.find course_unit_id
    course_unit.course
  end

  #those for attendance helper
  def formatted_date( date )
    date.strftime( "%Y-%b-%d" ) + " " + date.strftime( "%A" ).slice( 0..2 )  unless date == nil
  end

  def formatted_date_short( date )
    date.strftime( "%Y-%m-%d" ) + " " + date.strftime( "%A" ).slice( 0..2 )  unless date == nil
  end

  def get_weekday_name( date )
    date.strftime( "%A" ).slice( 0..2 )+"."  unless date == nil
  end

  def formatted_time( time )
    time.strftime( "%H:%M" )        unless time == nil
  end

  def get_attendance_course_unit( course_unit_id )
    course_unit = CourseUnit.find_by_id course_unit_id
    course_unit.title
  end

  def get_attendance_course( course_unit_id )
    course = Course.find course_unit_id
    course.name
  end

  # those for classtimetable helper
  def show_weekdays( weekdays )
    weekdays.join( " " ) unless weekdays.length < 2
  end

  def get_end_time( start_time, minutes_per_class )
    start_time+(minutes_per_class/60).hours
  end

  def times_perweek( weekdays )
    weekdays.length unless weekdays == nil
  end

  def get_class_day( start_day,weekdays,unit_class_times )
    class_day = []
    while unit_class_times > 0
      for i in  0...weekdays.length
        while get_weekday_name( start_day ) != weekdays[i]
          start_day += 1.day
        end
        unit_class_times -= 1
        class_day << start_day
      end
    end
    return class_day
  end


  # show user course and attendance info
  def get_registed_course_name( registed_unit )
    course = Course.find registed_unit
    course.name
  end

  def find_class_info( registed_unit )
    classtimetables=Classtimetable.where(registed_unit:registed_unit)
    classtimetables.map do |t|
      t.start_time
    end
  end

  # return all classtimetables(id) which has class today
  def get_timetable_attendance_ids
    returnarray=[]
    classtimetables = Classtimetable.all
    classtimetables.each do |c|
      ds=c.class_days.split(";")
      ds.each do |d|
        if Time.now.strftime( "%Y-%m-%d" )==d.split(" ").slice(0)
          returnarray<<c
        end
      end
    end
    return returnarray
  end

# attendancebook check attendance in attendance
 def checked?(attendance_record)
   if attendance_record != nil
     attendance_record.each do |att_r|
       if att_r.split(" ").slice(0) == Time.now.strftime( "%Y-%m-%d" )
         return true
       end
     end
   end
  return false
 end

end
