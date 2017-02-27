class ChangeColumnEmail < ActiveRecord::Migration[5.0]
  def change
  	 add_index :users, :email, unique: false
  	 add_index :users, :email, null: true
  end
end
