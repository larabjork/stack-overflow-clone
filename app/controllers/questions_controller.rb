class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    render :index
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new
    render :new
  end

  def create
    @user = User.find(params[:user_id])
    @question = @user.questions.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
    render :edit
  end

  def show
    @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
    render :show
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@user.question)
      # render :show
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
      def question_params
        params.require(:question).permit(:query)
      end

end
