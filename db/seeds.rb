(1..10).each do |i|
  User.create!(name: "test_user#{i}",
               email: "example_#{i}@gmail.com",
               password: "password",
               password_confirmation: "password")
end

(1..5).each do |i|
  Blog.create!(title: "test_title#{i}", body: "test_body_content#{i}", user_id: User.first.id)
end

(1..5).each do |i|
  Blog.create!(title: "test_title#{i}", body: "test_body_content#{i}", user_id: User.second.id)
end

(1..5).each do |i|
  Blog.create!(title: "test_title#{i}", body: "test_body_content#{i}", user_id: User.last.id)
end



