module V1
  class QuestionsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: :index

    # GET
    # Index questions
    def index
      @qs = Question.all
      render json: @qs, each_serializer: V1::QuestionSerializer
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
