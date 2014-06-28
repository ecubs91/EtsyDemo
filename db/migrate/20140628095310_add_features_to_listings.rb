class AddFeaturesToListings < ActiveRecord::Migration
  def change
    add_column :listings, :degree_subject, :string
    add_column :listings, :graduation_year, :string
    add_column :listings, :teaching_subject, :string
    add_column :listings, :location, :string
    add_column :listings, :tutoring_approach, :text
    add_column :listings, :tutorial_type, :string
    add_column :listings, :about_myself, :text
    add_column :listings, :teaching_experience, :text
    add_column :listings, :extracurricular_interests, :text
  end
end
