64.times do |x|
  64.times do |y|
    Pixel.create(x: x, y: y, color: '#ffffff')
  end
end

p "64x64 canvas initialized"
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?