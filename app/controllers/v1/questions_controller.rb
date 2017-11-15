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

      secrets = Rails.application.secrets
      if params[:id] == '8'
        diff = params[:time].to_i - Time.now.to_i
        if diff == 0
          solved = @current_user.solved(8)
          message = solved ? 'Congratulation! Q8 solved.' : 'OK already solved.'
        else
          message = "Failed. diff: #{diff}"
        end
        render json: {message: message}
      elsif params[:id] == '101'
        if secrets.a1 == params[:flag]
          solved = @current_user.solved(101)
          message = solved ? 'Congratulation! You are great searcher.' : 'OK already solved.'
          render json: {message: message}
        else
          render json: {message: 'SEARCH ME: filename:.zshrc language:shell 208d8bcb197a5a66b69178be' + 'e992092c34959525 Udpate'}
        end
      elsif params[:id] == '102'
        if request.method == 'PATCH'
          dummy = Dummy.new dummy_params
          if dummy.save
            return render json: {message: 'FLAG_N_ZUP'}
          else
            return render json: {error: dummy.errors}, status: :unprocessable_entity
          end
        end
        if secrets.a2 == params[:flag]
          solved = @current_user.solved(102)
          message = solved ? 'Congratulation! You are great esper.' : 'OK already solved.'
          render json: {message: message}
        else
          render json: {message: 'PATCH ME:'}
        end
      elsif params[:id] == '103'
        if secrets.a3 == params[:flag]
          solved = @current_user.solved(103)
          message = solved ? 'Congratulation! You are great jsr.' : 'OK already solved.'
          render json: {message: message}
        else
          render json: {message: 'DEVELOP ME: atcolor.cps.im.dendai.ac.jp.'}
        end
      elsif params[:id] == '104'
        if secrets.a4 == params[:flag]
          solved = @current_user.solved(104)
          message = solved ? 'Congratulation! You are great coder.' : 'OK already solved.'
          render json: {message: message}
        else
          render json: {message: 'READ ME: this code made by elzup@cpslab. OSS project.'}
        end
      end
    end

    def show
      if params[:id] == '5'
        if request.headers['X-FUTABA'] == 'ANZU'
          solved = @current_user.solved(5)
          message = solved ? 'Congratulation! Q5 solved.' : 'OK already solved.'
          render json: {message: message}
        else
          render json: {message: 'Please "GET" me with header. (X-FUTABA: ANZU)'}
        end

      elsif params[:id] == '6'
        if request.headers['X-RIDER'] == 'ISKANDAR'
          solved = @current_user.solved(6)
          message = solved ? 'Congratulation! Q6 solved.' : 'OK already solved.'
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
          message = solved ? 'Congratulation! Q7 solved.' : 'OK already solved.'
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
            message: 'Please "PUT" me with current unix timestamp. You can use field ["time"]. not ["GET", "POST"] use "PUT" fixed 2017-11-14'
        }
      end
    end

    def destroy
      if params[:id] == '4'
        solved = @current_user.solved(4)
        message = solved ? 'Congratulation! Q4 solved.' : 'OK already solved.'
        render json: {message: message}
      end
    end

    private
    def dummy_params
      params.permit(:a, :b, :c, :d, :e)
    end
  end

end
