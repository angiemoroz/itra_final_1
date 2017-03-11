class InstructionStepsController < ApplicationController
  before_action :set_instruction_step, only: [:show, :edit, :update, :destroy]

  # GET /instruction_steps
  # GET /instruction_steps.json
  def index
    @instruction_steps = InstructionStep.where(user_instruction_id: params[:user_instruction_id])
    @user_instruction_id = params[:user_instruction_id].to_i 
  end

  # GET /instruction_steps/1
  # GET /instruction_steps/1.json
  def show
    @user_instruction_id = InstructionStep.find(params[:id]).user_instruction_id
  end

  # GET /instruction_steps/new
  def new
    @instruction_step = InstructionStep.new
    @user_instruction_id = params[:user_instruction_id].to_i
  end

  # GET /instruction_steps/1/edit
  def edit
      @user_instruction_id = InstructionStep.find(params[:id]).user_instruction_id
  end

  # POST /instruction_steps
  # POST /instruction_steps.json
  def create
    @instruction_step = InstructionStep.new(instruction_step_params)
    respond_to do |format|
      if @instruction_step.save
        format.html { redirect_to @instruction_step, notice: 'Instruction step was successfully created.' }
        format.json { render :show, status: :created, location: @instruction_step }
      else
        format.html { render :new }
        format.json { render json: @instruction_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instruction_steps/1
  # PATCH/PUT /instruction_steps/1.json
  def update
    respond_to do |format|
      if @instruction_step.update(instruction_step_params)
        format.html { redirect_to @instruction_step, notice: 'Instruction step was successfully updated.' }
        format.json { render :show, status: :ok, location: @instruction_step }
      else
        format.html { render :edit }
        format.json { render json: @instruction_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instruction_steps/1
  # DELETE /instruction_steps/1.json
  def destroy
    @instruction_step.destroy
    respond_to do |format|
      format.html { redirect_to instruction_steps_url, notice: 'Instruction step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instruction_step
      @instruction_step = InstructionStep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instruction_step_params
      params.require(:instruction_step).permit(:title, :description, :user_instruction_id, :image)
    end
end
