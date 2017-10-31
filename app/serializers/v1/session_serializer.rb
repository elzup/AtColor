module V1
  class SessionSerializer < ActiveModel::Serializer

    attributes :id, :username, :access_token

  end
end