class AddCategoryToUserInstruction < ActiveRecord::Migration[5.0]
  def change
    add_column :user_instructions, :category, :string
  end
end
