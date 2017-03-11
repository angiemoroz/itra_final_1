class AddImageToInstructionStep < ActiveRecord::Migration[5.0]
  def change
    add_column :instruction_steps, :image, :string
  end
end
