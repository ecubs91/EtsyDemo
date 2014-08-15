require 'test_helper'

class ProposalsControllerTest < ActionController::TestCase
  setup do
    @proposal = proposals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proposals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proposal" do
    assert_difference('Proposal.count') do
      post :create, proposal: { message: @proposal.message, success: @proposal.success, tutor_id: @proposal.tutor_id, tutorial_request_id: @proposal.tutorial_request_id }
    end

    assert_redirected_to proposal_path(assigns(:proposal))
  end

  test "should show proposal" do
    get :show, id: @proposal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proposal
    assert_response :success
  end

  test "should update proposal" do
    patch :update, id: @proposal, proposal: { message: @proposal.message, success: @proposal.success, tutor_id: @proposal.tutor_id, tutorial_request_id: @proposal.tutorial_request_id }
    assert_redirected_to proposal_path(assigns(:proposal))
  end

  test "should destroy proposal" do
    assert_difference('Proposal.count', -1) do
      delete :destroy, id: @proposal
    end

    assert_redirected_to proposals_path
  end
end
