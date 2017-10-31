module V1
  class PixelSerializer < ActiveModel::Serializer

    attributes :id, :x, :y, :color

  end
end
