module V1
  class QuestionsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: :index

    # GET
    # Index questions
    def index
      @qs = Question.all
      render json: @qs, each_serializer: V1::QuestionSerializer
    end

    def update
      if params[:id] == '8'
        diff = params[:time].to_i - Time.now.to_i
        if diff == 0
          solved = @current_user.solved(8)
          message = solved ? 'Congratuation! Q6 solved.' : 'OK already solved.'
        else
          message = "Failed. diff: #{diff}"
        end
        render json: {message: message}
      end
    end

    def show
      if params[:id] == '5'
        if request.headers['X-FUTABA'] == 'ANZU'
          solved = @current_user.solved(5)
          message = solved ? 'Congratuation! Q5 solved.' : 'OK already solved.'
          render json: {message: message}
        else
          render json: {message: 'Please "GET" me with header. (X-FUTABA: ANZU)'}
        end

      elsif params[:id] == '6'
        if request.headers['X-RIDER'] == 'ISKANDAR'
          solved = @current_user.solved(6)
          message = solved ? 'Congratuation! Q6 solved.' : 'OK already solved.'
          render json: {message: message}
        else
          response.headers['X-SABER'] = 'ARTHUR'
          response.headers['X-RIDER'] = 'ISKANDAR'
          response.headers['X-ASSASSIN'] = 'HASSAN'
          response.headers['X-ARCHER'] = 'GILGAMESH'
          response.headers['X-LANCER'] = 'DIARMUID'
          response.headers['X-BERSERKER'] = 'LANCELOT'
          response.headers['X-CASTER'] = 'GILLES'
          render json: {message: 'Please "GET" me with sending back same header. (X-RIDER: ???). look at my header.'}
        end
      elsif params[:id] == '7'
        if params[:name] == '安部菜々'
          solved = @current_user.solved(7)
          message = solved ? 'Congratuation! Q7 solved.' : 'OK already solved.'
          render json: {message: message}
        else
          page = params[:page] || 1
          @res = Idol.page(page)
          response.header["X-Total"] = @res.total_count.to_s
          response.header["X-Total-Pages"] = @res.total_pages.to_s
          response.header["X-Page"] = @res.current_page.to_s
          response.header["X-Next-Page"] = @res.next_page.to_s
          response.header["X-Prev-Page"] = @res.prev_page.to_s
          render json: {
              idols: @res,
              message: 'Please Find name of Idol where id = 11. and "GET" me with parameter "name". You can use parameters ["name", "page"]. look at my header.'
          }
        end

      elsif params[:id] == '8'
        render json: {
            idols: @res,
            message: 'Please "POST" me with current unix timestamp. You can use field ["time"]. not "GET" use "POST"'
        }
      end
    end

    def destroy
      if params[:id] == '4'
        solved = @current_user.solved(4)
        message = solved ? 'Congratuation! Q4 solved.' : 'OK already solved.'
        render json: {message: message}
      end
    end
  end
end
