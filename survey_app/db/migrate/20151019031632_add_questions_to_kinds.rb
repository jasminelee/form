class AddQuestionsToKinds < ActiveRecord::Migration
  def change
  	add_column :kinds, :questions, :string
  end
end
