
describe "Question" do
  it "setup correct" do
    Question.setup
    expect(Question.count).to be(Question.qcount)
  end

  it "can migrate" do
    Question.create(qid: 1, title: 'can you GET?', description: 'GET /is_auth を確認する。', point: 2)
    Question.create(qid: 2, title: 'can you POST?', description: 'ユーザを作成する。', point: 1)
    Question.create(qid: 3, title: 'can you PUT?', description: '自分のプロフィールを更新する。', point: 3)

    Question.setup

    expect(Question.all.count).to be(Question.qcount)
  end
end
