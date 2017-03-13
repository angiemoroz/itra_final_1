class UserInstruction < ActiveRecord::Base
	belongs_to :user
	has_many :instruction_steps
	
	acts_as_taggable_on :tags
	#attr_accessor :tag_tokens
	attr_reader :tag_tokens
	
 	def tag_tokens=(tokens)
 		self.tag_ids = Tag.ids_from_tokens(tokens)
	end
end
