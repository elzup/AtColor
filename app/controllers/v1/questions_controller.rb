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
        if request.headers['X-FUTABA'] == 'ANZU'
          solved = @current_user.solved(5)
          message = solved.new_record? ? 'Congratuation! Q5 solved.' : 'OK already solved.'
          render json: {message: message}
        else
          render json: {message: 'Please "GET" me with header. (X-FUTABA: ANZU)'}
        end

      elsif params[:id] == '6'
        if request.headers['X-RIDER'] == 'ISKANDAR'
          solved = @current_user.solved(6)
          message = solved.new_record? ? 'Congratuation! Q6 solved.' : 'OK already solved.'
          render json: {message: message}
        else
          # TODO
          response.headers['X-SABER'] = 'ARTHUR'
          response.headers['X-RIDER'] = 'ISKANDAR'
          response.headers['X-ASSASSIN'] = 'HASSAN'
          response.headers['X-ARCHER'] = 'GILGAMESH'
          response.headers['X-LANCER'] = 'DIARMUID'
          response.headers['X-BERSERKER'] = 'LANCELOT'
          response.headers['X-CASTER'] = 'GILLES'
          render json: {message: 'Please "GET" me with sending back same header. (X-RIDER: ???). look at my header.'}
        end
      end
    end

    def destroy
      if params[:id] == '4'
        solved = @current_user.solved(4)
        message = solved.new_record? ? 'Congratuation! Q4 solved.' : 'OK already solved.'
        render json: {message: message}
      end
    end
  end
end
