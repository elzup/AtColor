require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    before do
      10.times {|i| User.create(username: "hoge#{i}", password: "hoge1234")}
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
      expect(user).to have_key(:solved_questions)
      expect(user).to have_key(:total_point)
      expect(user).not_to have_key(:password)
      expect(user).not_to have_key(:access_token)
    end
  end

  describe "PUT /users" do
    before do
      @user = User.create(username: "kyoko", password: "hoge1234")
      @headers = {Authentication: @user.access_token}
    end

    it "200" do
      put v1_users_path, params: {twitter: 'hoge'}, headers: @headers
      JSON.parse(response.body, {:symbolize_names => true})
    end

    it "user not found" do
      put v1_users_path, params: {twitter: 'hoge'}
      expect(response).to have_http_status(401)
    end

    it "works twitter" do
      put v1_users_path, params: {twitter: 'hoge'}, headers: @headers
      expect(User.last.twitter).to eql('hoge')
    end

    it "works lang" do
      put v1_users_path, params: {language: 'javascript'}, headers: @headers
      expect(User.last.language).to eql('javascript')
    end
  end

  describe "GET /users/:id" do
    before do

      Question.setup

      @user = User.create(username: "kyoko", password: "hoge1234")
      @user2 = User.create(username: "yui", password: "hoge1234")

      @headers = {Authentication: @user.access_token}
      get v1_user_path(@user.id), headers: @headers
      @data = JSON.parse(response.body, {:symbolize_names => true})
    end

    it "200" do
      expect(response).to have_http_status(200)
    end

    it "got user" do
      expect(@data[:username]).to eql('kyoko')
    end

    it "user not found" do
      get v1_user_path(99), headers: @headers
      expect(response).to have_http_status(404)
    end

    it "Q1 solved" do
      expect(@user.solvings.length).to be(1)
      expect(@user.solved_questions[0].qid).to be(1)
    end
  end
end
