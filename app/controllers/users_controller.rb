class UsersController < ApplicationController

   before_action :authenticate_user!, only: [:edit, :update, :destroy]

	def index
   # user_instructions = @user.UserInstruction.all
  end

  # GET /user_instructions/1
  # GET /user_instructions/1.json
  def show
    @user = User.find(params[:id])
    @instructions = @user.user_instructions.paginate(:per_page => 10, :page => params[:page])
  end

  # GET /user_instructions/new
  def new
     @user = User.new
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
   
  end

   def user_params
      params.require(:user).permit(:name)
    end
end
