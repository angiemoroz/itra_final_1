class AddUserIDtoUserInsruction < ActiveRecord::Migration[5.0]
  def change
    add_column :user_instructions, :user_id, :integer
  end
end
