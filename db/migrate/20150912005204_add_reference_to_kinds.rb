class AddReferenceToKinds < ActiveRecord::Migration
  def change
    add_reference :kinds, :user, index: true, foreign_key: true
  end
end
