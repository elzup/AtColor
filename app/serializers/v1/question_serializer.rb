module V1
  class QuestionSerializer < ActiveModel::Serializer

    attributes :id, :title, :description, :point, :qid
    has_many :solvers
  end
end
