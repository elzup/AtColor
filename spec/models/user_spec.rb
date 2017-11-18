describe "User" do
  before do
    @user = User.create(username: "hoge", password: "hoge1234")
    Question.setup
    @q1 = Question.find(2)
    @q2 = Question.find(4)
    @q3 = Question.find(6)
    @q4 = Question.find(8)
    @user.solved(@q2.qid)
    @user.solved(@q1.qid)
    @user.solved(@q4.qid)
    @user.solved(@q3.qid)

  end
  it "total count" do
    expect(@user.total_point).to be(@q1.point + @q2.point + @q3.point + @q4.point)
  end

  it "last solved at" do
    expect(@user.last_solved_at).to eq(Solving.find_by(question: @q3, user: @user).created_at)
  end
end

