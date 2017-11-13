module V1
  class QuestionSerializer < ActiveModel::Serializer

    attributes :id, :title, :description, :solvers
    has_many :solves
  end
end
