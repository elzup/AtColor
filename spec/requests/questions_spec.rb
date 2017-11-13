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
end
