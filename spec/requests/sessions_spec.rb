require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /sessions" do
    it "works! (now write some real specs)" do
      post v1_login_index_path, params: { username: 'hoge', password: 'hogefuga' }
      expect(response).to have_http_status(200)
    end
  end
end
