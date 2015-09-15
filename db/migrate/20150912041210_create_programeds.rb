class CreateProgrameds < ActiveRecord::Migration
  def change
    create_table :programeds do |t|
      t.references :program, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
