class Question < ApplicationRecord
  has_many :solvings
  has_many :users, :through => :solvings
  alias solvers users
end
