class AddKindReferenceToSurveys < ActiveRecord::Migration
  def change
    add_reference :surveys, :kind, index: true
  end
end
