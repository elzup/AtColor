module V1
  class SolvingSerializer < ActiveModel::Serializer
    has_one :question
    has_one :user
  end
end
