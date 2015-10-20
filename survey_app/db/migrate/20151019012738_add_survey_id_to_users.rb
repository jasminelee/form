class AddSurveyIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_id, :integer
    add_reference :surveys, :user, index: true
  end
end
