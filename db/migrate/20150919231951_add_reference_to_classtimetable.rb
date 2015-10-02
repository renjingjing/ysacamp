class AddReferenceToClasstimetable < ActiveRecord::Migration
  def change
    add_reference :classtimetables, :course_unit, index: true, foreign_key: true
  end
end
