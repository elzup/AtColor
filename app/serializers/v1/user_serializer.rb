module V1
  class UserSerializer < ActiveModel::Serializer

    attributes :id, :username, :twitter, :language
    # has_many :questions
    has_many :solves
  end
end
