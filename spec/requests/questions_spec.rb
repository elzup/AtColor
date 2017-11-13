require 'rails_helper'

RSpec.describe "Questions", type: :request do
  describe "GET /questions" do
    before do
      u = User.create(username: 'start', password: 'hogefuga')
      10.times do |i|
        q = Question.create(title: "hoge#{i}", description: "dddddd dddddd dddd #{i}")
        q.solvings.create(user: u)
      end
      get v1_q_path
      @data = JSON.parse(response.body, {:symbolize_names => true})
    end

    it "200" do
      expect(response).to have_http_status(200)
    end

    it "got questions" do
      expect(@data.length).to eq(10)
    end

    it "params" do
      question = @data[0]
      expect(question[:title]).to eq('hoge0')
      expect(question).to have_key(:title)
      expect(question).to have_key(:description)
      expect(question).to have_key(:solvers)
      expect(question[:solvers].length).to be(1)
    end
  end

end
