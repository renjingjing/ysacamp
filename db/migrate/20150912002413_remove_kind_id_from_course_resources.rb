class RemoveKindIdFromCourseResources < ActiveRecord::Migration
  def change
    remove_column :course_resources, :kind_id, :string
  end
end
