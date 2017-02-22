class CreateUserInstructions < ActiveRecord::Migration[5.0]
  def change
    create_table :user_instructions do |t|
      t.string :instruction
      t.date :date_of_creation

      t.timestamps
    end
  end
end
