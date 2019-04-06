class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :create_user_answer]
  before_action :authenticate_user!

  def index
    @questions = Question.all
    render :index, locals: { title: @title = "All Questions" }
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
      render :index, locals: { title: @title = "Questions #{current_user.username} Asked" }
  end

  def create_user_answer
    @user_answer = UserAnswer.new(answer_id: params[:answer_id], user_id: current_user.id)
    @user_answer.save
      render :show
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, answers_attributes: [:id, :content, :correct, :question_id])
    end
end
