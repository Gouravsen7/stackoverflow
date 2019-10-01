class AnswersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_question, only: [:create]

  def create
    @answer = @question.answers.build(answer_params)
    if @answer.save
      respond_to do |format|
        format.json { render json: { data: single_serializer.new(@answer, serializer: AnswerSerializer)}  }
      end
    else
      respond_to do |format|
        format.json { render json: { error: @answer.errors } }
      end
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    respond_to do |format|
      format.js {render :content_type => 'text/javascript', layout: false}
    end
  end

  private

    def answer_params
      params.require(:answer).permit(:description).merge({user: current_user})
    end

    def set_question
      @question = Question.find(params[:question_id])
    end
end