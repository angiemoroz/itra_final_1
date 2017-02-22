require 'test_helper'

class UserInstructionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_instruction = user_instructions(:one)
  end

  test "should get index" do
    get user_instructions_url
    assert_response :success
  end

  test "should get new" do
    get new_user_instruction_url
    assert_response :success
  end

  test "should create user_instruction" do
    assert_difference('UserInstruction.count') do
      post user_instructions_url, params: { user_instruction: { date_of_creation: @user_instruction.date_of_creation, instruction: @user_instruction.instruction } }
    end

    assert_redirected_to user_instruction_url(UserInstruction.last)
  end

  test "should show user_instruction" do
    get user_instruction_url(@user_instruction)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_instruction_url(@user_instruction)
    assert_response :success
  end

  test "should update user_instruction" do
    patch user_instruction_url(@user_instruction), params: { user_instruction: { date_of_creation: @user_instruction.date_of_creation, instruction: @user_instruction.instruction } }
    assert_redirected_to user_instruction_url(@user_instruction)
  end

  test "should destroy user_instruction" do
    assert_difference('UserInstruction.count', -1) do
      delete user_instruction_url(@user_instruction)
    end

    assert_redirected_to user_instructions_url
  end
end
