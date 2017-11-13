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

  describe "PUT /users" do
    before do
      @user = User.create(username: "kyoko", password: "hoge1234")
    end

    it "200" do
      put v1_edit_users_path, { id: @user.id, username: 'kyoko2' }
      data = JSON.parse(response.body, {:symbolize_names => true})
      expect(User.last.username).to be('kyoko2')
    end

    it "user not found" do
      expect(response).to have_http_status(200)
    end

    it "works!" do
      put v1_edit_users_path, { username: 'kyoko2' }
      @data = JSON.parse(response.body, {:symbolize_names => true})
      expect(User.last.username).to be('kyoko2')
    end

    it "works!" do
      put v1_edit_users_path, { username: 'kyoko3', language: 'javascript' }
      @data = JSON.parse(response.body, {:symbolize_names => true})
      expect(User.last.username).to be('kyoko3')
    end
  end
end
