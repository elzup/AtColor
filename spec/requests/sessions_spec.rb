require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /register" do
    after do
      User.create(username: 'start', password: 'hogefuga')
    end

    it "works! (now write some real specs)" do
      post v1_register_index_path, params: {username: 'hoge', password: 'password'}
      expect(response).to have_http_status(200)
    end

    it "register no password" do
      post v1_register_index_path, params: {username: 'hoge'}
      expect(response).to have_http_status(200)
    end

    it "register no username" do
      post v1_register_index_path, params: {passwrod: 'password'}
      expect(response).to have_http_status(200)
    end

    it "exists user" do
      post v1_login_index_path, params: {username: 'start', password: 'password'}
      expect(response).to have_http_status(422)
      p response.message
    end

    it "exists user" do
      post v1_login_index_path, params: {username: 'start', password: 'hogefuga'}
      expect(response).to have_http_status(422)
      p response.message
    end
  end

  describe "GET /sessions" do

    after do User.create(username: 'start', password: 'password')
    end

    it "works! (now write some real specs)" do
      post v1_login_index_path, params: {username: 'hoge', password: 'password'}
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
