require 'test_helper'

class InstructionStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instruction_step = instruction_steps(:one)
  end

  test "should get index" do
    get instruction_steps_url
    assert_response :success
  end

  test "should get new" do
    get new_instruction_step_url
    assert_response :success
  end

  test "should create instruction_step" do
    assert_difference('InstructionStep.count') do
      post instruction_steps_url, params: { instruction_step: { description: @instruction_step.description, title: @instruction_step.title } }
    end

    assert_redirected_to instruction_step_url(InstructionStep.last)
  end

  test "should show instruction_step" do
    get instruction_step_url(@instruction_step)
    assert_response :success
  end

  test "should get edit" do
    get edit_instruction_step_url(@instruction_step)
    assert_response :success
  end

  test "should update instruction_step" do
    patch instruction_step_url(@instruction_step), params: { instruction_step: { description: @instruction_step.description, title: @instruction_step.title } }
    assert_redirected_to instruction_step_url(@instruction_step)
  end

  test "should destroy instruction_step" do
    assert_difference('InstructionStep.count', -1) do
      delete instruction_step_url(@instruction_step)
    end

    assert_redirected_to instruction_steps_url
  end
end
