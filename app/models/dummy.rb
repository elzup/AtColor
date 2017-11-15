class Dummy < ApplicationRecord
  validates :a,
            presence: true,
            inclusion: {in: %w(hoge fuga)},
            length: {is: 4},
            format: {with: /\A[fh][ou]g[ae]\z/i, message: "/[fh][ou]g[ae]/i"}
  validates :b,
            presence: true,
            inclusion: {in: [77777], message: "is this lucky?"},
            numericality: {
                only_integer: true,
                odd: true,
                greater_than_or_equal_to: 77000,
                less_than: 78000,
            }
  validates :c,
            presence: true,
            inclusion: {in: [3.14159215], message: "pi"},
            length: {is: 10}
  validates :d,
            inclusion: {in: [false]},
            length: {is: 5}
  validates :e,
            presence: true,
            format: {with: /\A(?=.*?[a-z])(?=.*?\d)(?=.*?[!-\/:-@\[-`{-~])[!-~]{8,20}+\z/i, message: "week password"}
end
