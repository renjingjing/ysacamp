class RemoveReferenceFromCourseUnit < ActiveRecord::Migration
  def change
    remove_column :course_units, :user_id, :string
  end
end
