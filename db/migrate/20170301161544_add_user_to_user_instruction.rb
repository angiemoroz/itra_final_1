class AddUserToUserInstruction < ActiveRecord::Migration[5.0]
  def change
    add_column :user_instructions, :user, :string
  end
end
