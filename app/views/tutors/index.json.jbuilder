json.array!(@tutors) do |tutor|
  json.extract! tutor, :id, :university, :degree_subject, :teaching_subject, :location, :tutorial_type, :string, :about_myself, :tutoring_approach, :teaching_expexperience, :extracurricular_interests
  json.url tutor_url(tutor, format: :json)
end
