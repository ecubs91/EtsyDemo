class CreateTutors < ActiveRecord::Migration
  def change
    create_table :tutors do |t|
      t.string :university
      t.string :degree_subject
      t.string :teaching_subject
      t.string :location
      t.string :tutorial_type
      t.string :string
      t.text :about_myself
      t.text :tutoring_approach
      t.text :extracurricular_interests

      t.timestamps
    end
  end
end
