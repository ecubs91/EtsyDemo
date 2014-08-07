require 'test_helper'

class TutorsControllerTest < ActionController::TestCase
  setup do
    @tutor = tutors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tutors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tutor" do
    assert_difference('Tutor.count') do
      post :create, tutor: { about_myself: @tutor.about_myself, degree_subject: @tutor.degree_subject, extracurricular_interests: @tutor.extracurricular_interests, location: @tutor.location, string: @tutor.string, teaching_expexperience: @tutor.teaching_expexperience, teaching_subject: @tutor.teaching_subject, tutorial_type: @tutor.tutorial_type, tutoring_approach: @tutor.tutoring_approach, university: @tutor.university }
    end

    assert_redirected_to tutor_path(assigns(:tutor))
  end

  test "should show tutor" do
    get :show, id: @tutor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tutor
    assert_response :success
  end

  test "should update tutor" do
    patch :update, id: @tutor, tutor: { about_myself: @tutor.about_myself, degree_subject: @tutor.degree_subject, extracurricular_interests: @tutor.extracurricular_interests, location: @tutor.location, string: @tutor.string, teaching_expexperience: @tutor.teaching_expexperience, teaching_subject: @tutor.teaching_subject, tutorial_type: @tutor.tutorial_type, tutoring_approach: @tutor.tutoring_approach, university: @tutor.university }
    assert_redirected_to tutor_path(assigns(:tutor))
  end

  test "should destroy tutor" do
    assert_difference('Tutor.count', -1) do
      delete :destroy, id: @tutor
    end

    assert_redirected_to tutors_path
  end
end
