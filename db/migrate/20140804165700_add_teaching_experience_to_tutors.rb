class AddTeachingExperienceToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :teaching_experience, :text
  end
end
