module V1
  class UserSerializer < ActiveModel::Serializer

    attributes :id, :username, :twitter, :language

  end
end
