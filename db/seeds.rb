User.create!(name:  "Admin",
             email: "admin@gmail.com",
             password: "111111",
             password_confirmation: "111111",
             role: 1)

Category.create!(name:  "Tour In Country",
             description: "Tour trong nuoc",
             user_id: 1)
Category.create!(name:  "Tour International",
             description: "Tour nuoc ngoai",
             user_id: 1)

20.times do |n|
  name  = Faker::Name.name
  email = "user#{n+1}@gmail.com"
  password = "222222"
  User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password,
             role: 0)
end
