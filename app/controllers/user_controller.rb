class UserController < ApplicationController

   before_action :authenticate_user!, only: [:edit, :update, :destroy]

	def index
   # user_instructions = @user.UserInstruction.all
  end

  # GET /user_instructions/1
  # GET /user_instructions/1.json
  def show
  end

  # GET /user_instructions/new
  def new
   
  end

  # GET /user_instructions/1/edit
  def edit
  end

  # POST /user_instructions
  # POST /user_instructions.json
  def create
    
    end
end
