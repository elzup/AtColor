module V1
  class QuestionsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: :index

    # GET
    # Index questions
    def index
      @qs = Question.all
      render json: @qs, each_serializer: V1::QuestionSerializer
    end

    def create
    end

    def show
      if params[:id] == '5'
        if request.headers["X-FUTABA"] == "ANZU"
          solved = @current_user.solved(5)
          message = solved.new_record? ? "Congratuation! Q5 solved." : "OK already solved."
          render json: {message: message}
        else
          render json: {message: "Please post me with header. (X-FUTABA: ANZU)"}
        end
      end
    end

    def destroy
      if params[:id] == "4"
        solved = @current_user.solved(4)
        message = solved.new_record? ? "Congratuation! Q4 solved." : "OK already solved."
        render json: {message: message}
      end
    end
  end
end
