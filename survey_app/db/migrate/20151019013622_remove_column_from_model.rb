class RemoveColumnFromModel < ActiveRecord::Migration
  def change
  	remove_column :users, :user_id
  end
end
