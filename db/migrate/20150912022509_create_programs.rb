class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :program_name
      t.text :description

      t.timestamps null: false
    end
  end
end
