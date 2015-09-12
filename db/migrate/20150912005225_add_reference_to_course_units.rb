class AddReferenceToCourseUnits < ActiveRecord::Migration
  def change
    add_reference :course_units, :user, index: true, foreign_key: true
  end
end
