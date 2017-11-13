require 'rails_helper'

RSpec.describe "Questions", type: :request do
  describe "GET /questions" do
    before do
      10.times { |i| Question.create(title: "hoge#{i}", description: "dddddd dddddd dddd #{i}") }
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
      questions = @data[0]
      expect(questions[:title]).to eq('hoge0')
      expect(questions).to have_key(:title)
      expect(questions).to have_key(:description)
      expect(questions).to have_key(:solvers)
    end
  end

end
