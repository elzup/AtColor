require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    before do
      10.times { |i| User.create(username: "hoge#{i}", password: "hoge1234") }
      get v1_users_path
      @data = JSON.parse(response.body, {:symbolize_names => true})
    end

    it "200" do
      expect(response).to have_http_status(200)
    end

    it "got users" do
      expect(@data.length).to eq(10)
    end

    it "params" do
      user = @data[0]
      expect(user[:username]).to eq('hoge0')
      expect(user).not_to have_key(:password)
      expect(user).not_to have_key(:access_token)
    end
  end
end
