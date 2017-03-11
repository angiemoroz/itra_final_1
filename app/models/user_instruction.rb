class UserInstruction < ActiveRecord::Base
	belongs_to :user
	has_many :instruction_steps

	
 	
end
