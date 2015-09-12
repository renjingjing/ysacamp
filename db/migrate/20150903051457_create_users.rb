class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :parent_name
      t.string :email1
      t.string :email2
      t.string :password_digest
      t.string :address
      t.string :cell_phone
      t.string :home_phone
      t.string :gender
      t.string :school
      t.string :grade
      t.integer :age
      t.string :note
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
