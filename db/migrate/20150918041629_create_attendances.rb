class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :date_attended
      t.boolean :postpone
      t.string :note

      t.timestamps null: false
    end
  end
end
