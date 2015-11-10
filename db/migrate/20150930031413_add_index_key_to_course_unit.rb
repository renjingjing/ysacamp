class AddIndexKeyToCourseUnit < ActiveRecord::Migration
  def change
    add_index :course_units, :course_id
  end
end
