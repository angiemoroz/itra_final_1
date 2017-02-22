json.extract! user_instruction, :id, :instruction, :date_of_creation, :created_at, :updated_at
json.url user_instruction_url(user_instruction, format: :json)
