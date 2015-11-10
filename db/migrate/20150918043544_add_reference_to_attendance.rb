class AddReferenceToAttendance < ActiveRecord::Migration
  def change
    add_reference :attendances, :user, index: true, foreign_key: true
    add_reference :attendances, :course_unit, index: true, foreign_key: true
  end
end
