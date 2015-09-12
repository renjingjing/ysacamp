class CreateCourseResources < ActiveRecord::Migration
  def change
    create_table :course_resources do |t|
      t.string :title
      t.string :content
      t.string :kind_id
      t.string :resource_file
      t.string :kind_id
      t.string :note

      t.timestamps null: false
    end
  end
end
