require 'rails_helper'

RSpec.describe "Pixels", type: :request do
  before do
    4.times do |x|
      4.times do |y|
        Pixel.create(x: x, y: y, color: '#ffffff')
      end
    end
  end
  describe "GET /pixels" do
    before do
      get v1_pixels_path
      @data = JSON.parse(response.body, {:symbolize_names => true})
    end

    it "200" do
      expect(response).to have_http_status(200)
    end

    it "got pixels" do
      expect(@data.length).to eq(16)
    end

    it "params" do
      pixels = @data[0]
      expect(pixels[:color]).to eq('#ffffff')
      expect(pixels[:x]).to eq(0)
      expect(pixels[:y]).to eq(0)
    end
  end

  describe "GET /pixels" do
    before do
      @pixel = Pixel.first
      @params = { x: @pixel.x, y: @pixel.x, color: 'red' }
      put v1_pixels_path, params: @params
      @data = JSON.parse(response.body, {:symbolize_names => true})
    end

    it "updated" do
      # expect(Pixel.find_by(x: @pixel.x, y: @pixel.y).color).to eq('red')
    end
  end
end

