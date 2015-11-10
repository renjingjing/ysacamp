class AddReferenceToCourseUnit < ActiveRecord::Migration
  def change
    add_reference :course_units, :classtimetable, index: true, foreign_key: true
  end
end
