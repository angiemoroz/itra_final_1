class InstructionStep < ApplicationRecord
	belongs_to :user_instruction
	#attr_accessor :image

	mount_uploader :image, ImageUploader
end
