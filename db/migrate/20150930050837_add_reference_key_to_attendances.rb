class AddReferenceKeyToAttendances < ActiveRecord::Migration
  def change
    add_reference :attendances, :classtimetable, index: true, foreign_key: true
  end
end
