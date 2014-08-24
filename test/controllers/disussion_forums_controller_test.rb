require 'test_helper'

class DisussionForumsControllerTest < ActionController::TestCase
  setup do
    @disussion_forum = disussion_forums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disussion_forums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disussion_forum" do
    assert_difference('DisussionForum.count') do
      post :create, disussion_forum: { details: @disussion_forum.details, question: @disussion_forum.question, subject: @disussion_forum.subject }
    end

    assert_redirected_to disussion_forum_path(assigns(:disussion_forum))
  end

  test "should show disussion_forum" do
    get :show, id: @disussion_forum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @disussion_forum
    assert_response :success
  end

  test "should update disussion_forum" do
    patch :update, id: @disussion_forum, disussion_forum: { details: @disussion_forum.details, question: @disussion_forum.question, subject: @disussion_forum.subject }
    assert_redirected_to disussion_forum_path(assigns(:disussion_forum))
  end

  test "should destroy disussion_forum" do
    assert_difference('DisussionForum.count', -1) do
      delete :destroy, id: @disussion_forum
    end

    assert_redirected_to disussion_forums_path
  end
end
