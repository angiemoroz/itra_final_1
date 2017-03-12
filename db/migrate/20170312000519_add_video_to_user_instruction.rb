class AddVideoToUserInstruction < ActiveRecord::Migration[5.0]
  def change
    add_column :user_instructions, :video, :string
  end
end
