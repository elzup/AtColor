class Question < ApplicationRecord
  has_many :solvings
  has_many :users, :through => :solvings
  alias solvers users

  def self.setup
    Question.delete_all
    Question.create(qid: 1, title: 'can you GET?', description: '自分のプロフィールを取得する。', point: 2)
    Question.create(qid: 2, title: 'can you POST?', description: 'ユーザを作成する。', point: 1)
    Question.create(qid: 3, title: 'can you PUT?', description: '自分のプロフィールを更新する。', point: 3)

    Question.create(qid: 4, title: 'can you DELETE?', description: '/q/4 に DELETE リクエストを送る。', point: 5)

    Question.create(qid: 5, title: 'can you set headers?', description: 'GET /q/5', point: 7)
    Question.create(qid: 6, title: 'can you get headers?', description: 'GET /q/6', point: 11)

    Question.create(qid: 7, title: 'can you paging?', description: 'GET /q/7', point: 13)

    Question.create(qid: 8, title: 'can you timestamp?', description: 'GET /q/8', point: 17)
    # Question.create(qid: 9, title: 'can you search?', description: 'GET /q/9', point: 19)
    # Question.create(qid: 10, title: 'can you resend?', description: 'POST /q/10', point: 23)

    Question.create(qid: 101, title: 'are you searcher?', description: 'POST /q/101', point: 0.1)
    Question.create(qid: 102, title: 'are you espr?', description: 'POST /q/102', point: 0.2)
    Question.create(qid: 103, title: 'are you jsr?', description: 'POST /q/103', point: 0.3)
    Question.create(qid: 104, title: 'are you coder?', description: 'POST /q/104', point: 0.4)
  end

end
