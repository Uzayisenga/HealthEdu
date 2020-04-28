class McQuestionsController < ApplicationController
  before_action :set_mc_question, only: [:show, :edit, :update, :destroy]

  # GET /mc_questions
  # GET /mc_questions.json
  def index
    @mc_questions = McQuestion.all
    #questions = McQuestion.all
  end

  # GET /mc_questions/1
  # GET /mc_questions/1.json
  def show
  end

  # GET /mc_questions/new
  def new
    @mc_question = McQuestion.new
  end

  # GET /mc_questions/1/edit
  def edit
  end

  # POST /mc_questions
  # POST /mc_questions.json
  def create
    @mc_question = McQuestion.new(mc_question_params)

    respond_to do |format|
      if @mc_question.save
        format.html { redirect_to @mc_question, notice: 'Mc question was successfully created.' }
        format.json { render :show, status: :created, location: @mc_question }
      else
        format.html { render :new }
        format.json { render json: @mc_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mc_questions/1
  # PATCH/PUT /mc_questions/1.json
  def update
    respond_to do |format|
      if @mc_question.update(mc_question_params)
        format.html { redirect_to @mc_question, notice: 'Mc question was successfully updated.' }
        format.json { render :show, status: :ok, location: @mc_question }
      else
        format.html { render :edit }
        format.json { render json: @mc_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mc_questions/1
  # DELETE /mc_questions/1.json
  def destroy
    @mc_question.destroy
    respond_to do |format|
      format.html { redirect_to mc_questions_url, notice: 'Mc question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mc_question
      @mc_question = McQuestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mc_question_params
      params.require(:mc_question).permit(:question, :answer, :distractor_1, :distractor_2, :distractor_3, :quiz_id)
    end

    def grading
      @assesment ||= McQuestion.find(session[:assesment_id]) if session[:assesment_id]
      total = @assesment.questions.count.to_i
     
      session[:total]   = total
      session[:correct] = 0
      @total   = session[:total]
     
      answerid = params[:answer]
      @answer = answerid ? Answer.find(answerid) : nil
     
     
      if @answer and @answer.correct
        @correct = true
        session[:correct] += 1
      else
       @correct = false
      end
     
      redirect_to results_url
     end
     
     def results
       @correct = session[:correct]
       @total   = session[:total]
     
       @score = @correct * 100 / @total
     end
end
