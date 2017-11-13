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
    Question.setup

    # idols
    Idol.setup
  end

  task :init_idol => :environment do
    Idol.setup
  end


end
