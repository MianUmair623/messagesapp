class AddNametoUsers < ActiveRecord::Migration[6.1]
  def change
  	add_column :users, :username, :string, :unique => true
  end
end
