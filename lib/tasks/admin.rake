namespace :admin do
  task :init => :environment do
    AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
    Pixel.delete_all
    64.times do |x|
      64.times do |y|
        Pixel.create(x: x, y: y, color: '#ffffff')
      end
    end

    # questions
    Question.create(title: 'can you GET?', description: '自分のプロフィールを取得する。', point: 2)
    Question.create(title: 'can you POST?', description: 'ユーザを作成する。', point: 1)
    Question.create(title: 'can you PUT?', description: '自分のプロフィールを更新する。', point: 3)

    Question.create(title: 'can you DELETE?', description: '/q/4 に DELETE リクエストを送る。', point: 5)

    Question.create(title: 'can you set headers?', description: 'GET /q/5', point: 7)
    Question.create(title: 'can you get headers?', description: 'GET /q/6', point: 11)

    Question.create(title: 'can you get next page?', description: 'GET /q/7', point: 13)
    Question.create(title: 'can you get last page?', description: 'GET /q/8', point: 17)

    Question.create(title: 'can you timestamp?', description: 'POST /q/9', point: 19)
    Question.create(title: 'can you resend?', description: 'POST /q/10', point: 23)

    Question.create(title: 'can you find me?', description: '???', point: 0.1)
    Question.create(title: 'can you find me?', description: '???', point: 0.2)
    Question.create(title: 'can you find me?', description: '???', point: 0.3)
    Question.create(title: 'can you find me?', description: '???', point: 0.4)
  end

end
