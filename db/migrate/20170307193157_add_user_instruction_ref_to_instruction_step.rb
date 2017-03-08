class AddUserInstructionRefToInstructionStep < ActiveRecord::Migration[5.0]
  def change
    add_reference :instruction_steps, :user_instruction, foreign_key: true
  end
end
