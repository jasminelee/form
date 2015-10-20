class DropTables < ActiveRecord::Migration
  def change
  	drop_table :survey_surveys
  	drop_table :survey_questions
  	drop_table :survey_options
  	drop_table :survey_attempts
  	drop_table :survey_answers
  end
end
