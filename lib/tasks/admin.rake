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
    Question.create(title: 'http GET', description: '自分のプロフィールを取得する。', point: 5)
    Question.create(title: 'http POST', description: 'ユーザを作成する。', point: 5)
    Question.create(title: 'http PUT', description: '自分のプロフィールを更新する。', point: 5)
  end

end
