class RemoveReferenceFromCourse < ActiveRecord::Migration
  def change
    remove_reference :courses, :program, index: true, foreign_key: true
  end
end
