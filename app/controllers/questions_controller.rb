class QuestionsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question, only: [:edit, :update, :destroy, :show]

  def index
    @questions = Question.all
  end

  def new
    @question = current_user.questions.build()
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to questions_path
    else
      render new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render edit
    end
  end

  def show
    @answers = @question.answers
  end

  def destroy
    @question.destroy
    redirected_to questions_path, notice: 'Question has been destroyed successfully.'
  end

  private 
    
    def question_params
      params.require(:question).permit(:description)
    end

    def set_question
      @question = Question.find(params[:id])
    end
end
