require 'rails_helper'

RSpec.describe "Questions", type: :request do
  before :each do
    Question.setup
    @user = User.create(username: 'start', password: 'hogefuga')
    @headers = {Authentication: @user.access_token}
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
      get v1_q_path(5), {headers: {Authentication: @user.access_token, 'X-FUTABA': 'ANZU'}}
      expect(@user.solvings.length).to be(1)
      expect(@user.solved_questions[0].qid).to be(5)
    end
  end
end
