module ApplicationHelper
  #those for attendance helper
  def formatted_date( date )
    date.strftime( "%Y-%b-%d" ) + " " + date.strftime( "%A" ).slice( 0..2 )  unless date == nil
  end

  def get_weekday_name( date )
    date.strftime( "%A" ).slice( 0..2 )+"."  unless date == nil
  end

  def formatted_time( time )
    time.strftime( "%H:%M" )        unless time == nil
  end

  def get_attendance_course_unit( course_unit_id )
    course_unit=CourseUnit.find_by_id course_unit_id
    course_unit.title
  end

  # those for classtimetable helper
  def show_weekdays( weekdays )
    weekdays.join( " " ) unless weekdays.length < 2
  end

  def times_perweek( weekdays )
    weekdays.length unless weekdays == nil
  end

  def get_end_day( start_day,weekdays,unit_class_times )
    while unit_class_times > 0
      for i in  0...weekdays.length
        while get_weekday_name( start_day ) != weekdays[i]
          start_day += 1.day
        end
        unit_class_times -= 1
      end
    end
    return start_day
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

  # def find_class_info( registed_units )
  #   .map {|registed_unit| registed_unit.title
  #   Classtimetable.find_by_course_unit_id registed_unit.id
  # end

end
