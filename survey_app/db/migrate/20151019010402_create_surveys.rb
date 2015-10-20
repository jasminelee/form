class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :questions, :null => false
      t.integer :user, :null => false
      t.string :answers, :null => false

      t.timestamps null: false
    end
  end
end
