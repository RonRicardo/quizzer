class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :create_user_answer]
  before_action :authenticate_user!

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    3.times { @question.answers.build }
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
      if @question.valid? && @question.save
        redirect_to question_path(@question)
      else
        render :new
    end
  end

  def user_questions
    @questions = current_user.questions
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, answers_attributes: [:id, :content, :correct, :question_id])
    end
end
