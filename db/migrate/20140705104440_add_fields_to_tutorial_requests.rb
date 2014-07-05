class AddFieldsToTutorialRequests < ActiveRecord::Migration
  def change
    add_column :tutorial_requests, :tutor_id, :integer
    add_column :tutorial_requests, :student_id, :integer
  end
end
