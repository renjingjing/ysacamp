class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :course_units, :users do |t|
      # t.index [:course_unit_id, :user_id]
      # t.index [:user_id, :course_unit_id]
    end
  end
end
