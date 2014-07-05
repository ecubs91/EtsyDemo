require 'test_helper'

class TutorialRequestsControllerTest < ActionController::TestCase
  setup do
    @tutorial_request = tutorial_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tutorial_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tutorial_request" do
    assert_difference('TutorialRequest.count') do
      post :create, tutorial_request: { duration: @tutorial_request.duration, level: @tutorial_request.level, subject: @tutorial_request.subject }
    end

    assert_redirected_to tutorial_request_path(assigns(:tutorial_request))
  end

  test "should show tutorial_request" do
    get :show, id: @tutorial_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tutorial_request
    assert_response :success
  end

  test "should update tutorial_request" do
    patch :update, id: @tutorial_request, tutorial_request: { duration: @tutorial_request.duration, level: @tutorial_request.level, subject: @tutorial_request.subject }
    assert_redirected_to tutorial_request_path(assigns(:tutorial_request))
  end

  test "should destroy tutorial_request" do
    assert_difference('TutorialRequest.count', -1) do
      delete :destroy, id: @tutorial_request
    end

    assert_redirected_to tutorial_requests_path
  end
end
