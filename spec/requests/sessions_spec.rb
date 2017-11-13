require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /sessions" do
    it "works! (now write some real specs)" do
      post v1_login_index_path, params: { username: 'hoge', password: 'hogefuga' }
      expect(response).to have_http_status(200)
    end

    it "register no password" do
      post v1_login_index_path, params: { username: 'hoge' }
      expect(response).to have_http_status(200)
    end

    it "register no username" do
      post v1_login_index_path, params: { passwrod: 'hoge' }
      expect(response).to have_http_status(200)
    end

    it "no password" do
      User.create(username: 'fuga', password: 'hogefuga')
      post v1_login_index_path, params: { username: 'fuga' }
      expect(response).to have_http_status(422)
    end

    it "invalid password" do
      User.create(username: 'fuga', password: 'hogefuga')
      post v1_login_index_path, params: { username: 'fuga', password: 'a' }
      expect(response).to have_http_status(422)
    end
  end
end
