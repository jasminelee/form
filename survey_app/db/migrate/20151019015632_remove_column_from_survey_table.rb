class RemoveColumnFromSurveyTable < ActiveRecord::Migration
  def change
 	remove_column :surveys, :user
  end
end
