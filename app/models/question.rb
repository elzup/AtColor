class Question < ApplicationRecord
  has_many :solvings
  has_many :users, :through => :solvings
  alias solvers users

  @@qcount = 13

  def qcount
    @@qcount
  end

  def self.setup
    Question.find_or_create_by(qid: 1, title: 'can you GET?', description: 'GET /is_auth を確認する。', point: 2)
    Question.find_or_create_by(qid: 2, title: 'can you POST?', description: 'ユーザを作成する。', point: 1)
    Question.find_or_create_by(qid: 3, title: 'can you PUT?', description: '自分のプロフィールを更新する。', point: 3)

    Question.find_or_create_by(qid: 4, title: 'can you DELETE?', description: '/q/4 に DELETE リクエストを送る。', point: 5)

    Question.find_or_create_by(qid: 5, title: 'can you set headers?', description: 'GET /q/5', point: 7)
    Question.find_or_create_by(qid: 6, title: 'can you get headers?', description: 'GET /q/6', point: 11)

    Question.find_or_create_by(qid: 7, title: 'can you paging?', description: 'GET /q/7', point: 13)

    Question.find_or_create_by(qid: 8, title: 'can you timestamp?', description: 'GET /q/8', point: 17)

    # Question.find_or_create_by(qid: 10, title: 'can you resend?', description: 'POST /q/10', point: 23)

    Question.find_or_create_by(qid: 101, title: 'are you searcher?', description: 'PUT /q/101?flag=???', point: 1)
    Question.find_or_create_by(qid: 102, title: 'are you espr?', description: 'PUT /q/102?flag=???', point: 1)
    Question.find_or_create_by(qid: 103, title: 'are you jsr?', description: 'PUT /q/103?flag=???', point: 1)
    Question.find_or_create_by(qid: 104, title: 'are you coder?', description: 'PUT /q/104?flag=???', point: 1)

    Question.find_or_create_by(qid: 9, title: 'can you image?', description: 'GET /q/9', point: 19)
  end

end
