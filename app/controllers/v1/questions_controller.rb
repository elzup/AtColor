module V1
  class QuestionsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: :index

    # GET
    # Index questions
    def index
      @qs = Question.all
      render json: @qs, each_serializer: V1::QuestionSerializer
    end
  end
end
