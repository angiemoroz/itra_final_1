class UserInstruction < ActiveRecord::Base
	belongs_to :user
	has_many :instruction_steps
	
	acts_as_taggable_on :tags
	#attr_accessor :tag_tokens
	
end
