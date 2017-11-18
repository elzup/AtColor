namespace :admin do
  task :init => :environment do
    p 'locked by source'
    return
    AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
    Solving.delete_all
    User.delete_all
    Pixel.delete_all
    64.times do |x|
      64.times do |y|
        Pixel.create(x: x, y: y, color: '#ffffff')
      end
    end

    # questions
    Question.setup

    # idols
    Idol.setup
  end

  task :init_idol => :environment do
    Idol.setup
  end

  task :init_question => :environment do
    Question.setup
  end

end
