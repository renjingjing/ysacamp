class Classtimetable < ActiveRecord::Base
belongs_to      :course_unit

has_many        :attendances,dependent: :nullify

validates       :start_time,
                :start_day,
                :unit_class_times,
                :minutes_per_class,
                :weekdays,presence: true
  end
