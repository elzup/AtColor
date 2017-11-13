module V1
  class QuestionSerializer < ActiveModel::Serializer

    attributes :id, :title, :description
  end
end
