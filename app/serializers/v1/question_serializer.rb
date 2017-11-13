module V1
  class QuestionSerializer < ActiveModel::Serializer

    attributes :id, :title, :description
    has_many :solvers
  end
end
