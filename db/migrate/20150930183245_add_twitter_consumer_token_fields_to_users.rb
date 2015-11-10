class AddTwitterConsumerTokenFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_consumer_token, :string
  end
end
