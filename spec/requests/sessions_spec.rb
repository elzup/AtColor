require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /register" do
    before :all do
      User.create(username: 'start', password: 'hogefuga')
    end

    it "works!" do
      post v1_register_index_path, params: {username: 'hoge', password: 'password'}
      result = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(result["id"]).to be_truthy
      expect(result["access_token"]).to be_truthy
    end

    it "register no password" do
      post v1_register_index_path, params: {username: 'hoge'}
      expect(response).to have_http_status(422)
    end

    it "register no username" do
      post v1_register_index_path, params: {passwrod: 'password'}
      expect(response).to have_http_status(422)
    end

    it "exists user" do
      post v1_register_index_path, params: {username: 'start', password: 'password'}
      result = JSON.parse(response.body)
      expect(result["error"]).to include("既に")
    end
  end

  describe "GET /sessions" do

    before do
      User.create(username: 'start', password: 'password')
    end

    it "works!" do
      post v1_login_index_path, params: {username: 'start', password: 'password'}
      expect(response).to have_http_status(200)
    end

    it "no password" do
      post v1_login_index_path, params: {username: 'start'}
      expect(response).to have_http_status(422)
    end

    it "invalid password" do
      post v1_login_index_path, params: {username: 'start', password: 'a'}
      expect(response).to have_http_status(422)
    end
  end
end
