require 'rails_helper'

RSpec.describe "Questions", type: :request do
  before :each do
    Question.setup
    Idol.setup
    @user = User.create(username: 'start', password: 'hogefuga')
    @headers = {Authorization: @user.access_token}
  end

  describe "GET /q" do
    before do
      Question.first.solvings.create(user: @user)
      get v1_q_index_path
      @data = JSON.parse(response.body, {:symbolize_names => true})
    end

    it "200" do
      expect(response).to have_http_status(200)
    end

    it "params" do
      question = @data[0]
      expect(question).to have_key(:title)
      expect(question).to have_key(:description)
      expect(question).to have_key(:solvers)
      expect(question[:solvers].length).to be(1)
    end

    it "ordered by qid" do
      ans = Question.all.map(&:qid).sort
      qids = @data.map {|v| v[:qid]}
      expect(qids).to match(ans)
    end

    it "solver is ordered faster" do
      u1 = User.create(username: 'a', password: 'hogefuga')
      u2 = User.create(username: 'b', password: 'hogefuga')
      u3 = User.create(username: 'c', password: 'hogefuga')

      u1.solved(5)
      u3.solved(5)
      u2.solved(5)

      expect([u1.id, u3.id, u2.id]).to match_array(Question.find_by_qid(5).solvers.map(&:id))

    end
  end

  describe "DELETE /q/4" do
    it "Q4 solved" do
      delete v1_q_path(4), {headers: @headers}
      expect(@user.solvings.length).to be(1)
      expect(@user.solved_questions[0].qid).to be(4)
    end
  end

  describe "GET /q/5" do
    it "Q5 question" do
      get v1_q_path(5), {headers: @headers}
      @data = JSON.parse(response.body, {:symbolize_names => true})
      expect(@data[:message]).to include('X-FUTABA')
      expect(@data[:message]).to include('ANZU')
    end

    it "Q5 solved" do
      get v1_q_path(5), {headers: {Authorization: @user.access_token, 'X-FUTABA': 'ANZU'}}
      expect(@user.solvings.length).to be(1)
      expect(@user.solved_questions[0].qid).to be(5)
    end
  end

  describe "GET /q/6" do
    it "Q6 question" do
      get v1_q_path(6), {headers: @headers}
      @data = JSON.parse(response.body, {:symbolize_names => true})
      expect(response.headers).to have_key('X-RIDER')
      expect(response.headers['X-RIDER']).to eql('ISKANDAR')
      expect(@data[:message]).to include('X-RIDER')
      expect(@data[:message]).to include('my header')
    end

    it "Q6 solved" do
      get v1_q_path(6), {headers: {Authorization: @user.access_token, 'X-RIDER': 'ISKANDAR'}}
      expect(@user.solvings.length).to be(1)
      expect(@user.solved_questions[0].qid).to be(6)
    end

    it "Q6 failed" do
      get v1_q_path(6), {headers: {Authorization: @user.access_token, 'X-RIDER': 'GUNSO'}}
      get v1_q_path(6), {headers: {Authorization: @user.access_token, 'X-ARCHER': 'ISKANDAR'}}
      expect(@user.solvings.length).to be(0)
    end
  end

  describe "GET /q/7" do
    it "Q7 question" do
      get v1_q_path(7), {headers: @headers}
      @data = JSON.parse(response.body, {:symbolize_names => true})
      expect(response.headers).to have_key('X-Total-Pages')
      expect(response.headers).to have_key('X-Page')
    end

    it "Q7 paging" do
      get v1_q_path(7), {params: { name: '安部菜々' }, headers: @headers}
      expect(@user.solvings.length).to be(1)
      expect(@user.solved_questions[0].qid).to be(7)
    end

    it "Q7 paging" do
      get v1_q_path(7), {params: { page: 3 }, headers: @headers}
      @data = JSON.parse(response.body, {:symbolize_names => true})
      expect(@data).to have_key(:idols)
      expect(@data[:idols].length).to eql(10)
      expect(response.headers['X-Next-Page']).to eql("4")
      expect(response.headers['X-Prev-Page']).to eql("2")
    end
  end

  describe "GET /q/8" do
    it "Q8 question" do
      get v1_q_path(8), {headers: @headers}
      @data = JSON.parse(response.body, {:symbolize_names => true})
      expect(@data[:message]).to include('current unix timestamp')
    end

    it "Q8 solve" do
      put v1_q_path(8), { params: { time: Time.now.to_i }, headers: @headers }
      expect(@user.solvings.length).to be(1)
      expect(@user.solved_questions[0].qid).to be(8)
    end

    it "Q8 failed" do
      put v1_q_path(9), { params: { time: Time.now.to_i + 10 }, headers: @headers }
      expect(@user.solvings.length).to be(0)
    end
  end

  describe "PUT /q/104" do
    it "all OK" do
      # find me
      put v1_q_path(104), { params: { flag: 'FLAG_A_TC_OLO_R' }, headers: @headers }
      expect(@user.solvings.length).to be(1)
      expect(@user.solved_questions[0].qid).to be(104)
    end
  end

  describe "PUT /q/10X" do
    it '101 works' do
      put v1_q_path(101), { headers: @headers }
      @text = 'SEARCH ME'
    end
    it '102 works' do
      put v1_q_path(102), { headers: @headers }
      @text = 'PATCH ME'
    end
    it '103 works' do
      put v1_q_path(103), { headers: @headers }
      @text = 'DEVELOP ME'
    end
    it '104 works' do
      put v1_q_path(104), { headers: @headers }
      @text = 'READ ME'
    end

    after :each do
      expect(response).to have_http_status(200)
      data = JSON.parse(response.body, {:symbolize_names => true})
      expect(data[:message]).to include(@text)
    end
  end
end
