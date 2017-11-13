class Question < ApplicationRecord
  has_many :solves
  has_many :users, :through => :solves
  alias solvers users
end
