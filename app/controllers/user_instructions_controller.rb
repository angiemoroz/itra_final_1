class UserInstructionsController < ApplicationController


  before_action :set_user_instruction, only: [:show, :edit, :update, :destroy, :get_appropriate_tags]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  
  # GET /user_instructions
  # GET /user_instructions.json
  def index
    if params[:tag]
      @user_instructions = UserInstruction.tagged_with(params[:tag]).paginate(:per_page => 1, :page => params[:page])
    else  
      @user_instructions = UserInstruction.paginate(:per_page => 1, :page => params[:page])
    end
  end

  # GET /user_instructions/1
  # GET /user_instructions/1.json
  def show
    @steps = @user_instruction.instruction_steps.paginate(:per_page => 1, :page => params[:page])
    
  end

  # GET /user_instructions/new
  def new
    @user_instruction = UserInstruction.new
    @user_instruction.date_of_creation = Date.current
  end

  # GET /user_instructions/1/edit
  def edit
    @steps = @user_instruction.instruction_steps
  end

  # POST /user_instructions
  # POST /user_instructions.json
  def create  

    @user_instruction = UserInstruction.new(user_instruction_params)
    @user_instruction.user = current_user

    respond_to do |format|
      if @user_instruction.save
        format.html { redirect_to @user_instruction, notice: 'User instruction was successfully created.' }
        format.json { render :show, status: :created, location: @user_instruction }
      else
        format.html { render :new }
        format.json { render json: @user_instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_instructions/1
  # PATCH/PUT /user_instructions/1.json
  def update
    respond_to do |format|
      if @user_instruction.update(user_instruction_params)
        format.html { redirect_to @user_instruction, notice: 'User instruction was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_instruction }
      else
        format.html { render :edit }
        format.json { render json: @user_instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_instructions/1
  # DELETE /user_instructions/1.json
  def destroy
    @user_instruction.destroy
    respond_to do |format|
      format.html { redirect_to user_instructions_url, notice: 'User instruction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_all_tags
    search_word = params[:word]
    words = Tag.all.select {|u| u.name.start_with?(search_word)}
    render json: words.map { |w| w.name  }.to_json
  end

  def get_appropriate_tags
    render json: @user_instruction.tag_list.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_instruction
      @user_instruction = UserInstruction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_instruction_params
      
     
      params.require(:user_instruction).permit(:instruction, :date_of_creation, :user, :category, :video, :tag_list)
    end
end
