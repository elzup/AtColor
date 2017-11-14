module V1
  class QuestionSerializer < ActiveModel::Serializer

    attributes :id, :title, :description, :point
    has_many :solvers
  end
end
